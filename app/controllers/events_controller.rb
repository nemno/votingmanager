class EventsController < ApplicationController
  
  before_filter :authenticate, :except => [ :index, :show]
  before_filter :correct_user, :only => [:edit, :update, :destroy, :addusertoevent]
  
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    
    if params[:userid]
      
      @user= User.find(params[:userid])
      @events= @user.event
      
    end
    
    if params[:withadmin]
       
      $query = "user_id = %s" % params[:userid]
      $temp = " AND admin = 1"
      $query.concat($temp)

      @currenteventusers = Usersevent.where($query)
      
    end
    
    if params[:adminjsonform]
      render :json => @currenteventusers
      
    else
    
    if params[:jsonform]
        render :json => @events

    else

        respond_to do |format|
          format.html # index.html.erb
          format.json { render :json => @events }
        end

    end
    end
        
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @event }
    end
  end
  
  

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    
    puts("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
           @usersevents = Usersevent.new()
    if params[:userid] and params[:admin]
      

       @usersevents.user_id = params[:userid]
       @usersevents.event_id = params[:id]
       @usersevents.admin = params[:admin]
       @usersevents.save
       
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        @usersevents = Usersevent.new()
        @usersevents.user_id = @current_user.id
        @usersevents.event_id = @event.id
        @usersevents.admin = 1
        
        if  @usersevents.save
          format.html { redirect_to @event, :notice => 'Event was successfully created.' }
          format.json { render :json => @event, :status => :created, :location => @event }
        else
          format.html { render :action => "new" }
          format.json { render :json => @event.errors, :status => :unprocessable_entity }
        end
        
      else
        format.html { render :action => "new" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  # PUT /events/1/addusertoevent
  def addusertoevent

    if params[:userid] and params[:admin]
      
       @usersevents = Usersevent.new()
       @usersevents.user_id = params[:userid]
       @usersevents.event_id = params[:id]
       @usersevents.admin = params[:admin]
       @usersevents.save
       
    end
    
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    
    /if params[:adduser] and params[:admin]

      puts("show0000000000000000000000000000000")
      puts(@current_user)
      puts(@event)
      $prequery = "event_id = %d" % @event.id
      $tempqurey = " AND user_id = %d" % @current_user.id
      $prequery.concat($tempqurey)
      
      @currenteventusers = Usersevent.where($prequery)
      
     
        
      if @currenteventusers.include?(@current_user)#@event.user.include?(@current_user)
         $query = "event_id = %s" % params[:id]
         $temp = " AND user_id = %s" % @current_user.id
         $query.concat($temp)
         
         puts("belemegyw0000000000000000000000000000000")
         
         @currentuserevent = Userevents.where($query)
         
         if @currentuserevent.admin==1
           
           @usersevents = Usersevent.new()
           @usersevents.user_id = params[:adduser]
           @usersevents.event_id = @event.id
           @usersevents.admin = params[:admin]
           @usersevents.save
         end
      else
         puts("nem megy belew0000000000000000000000000000000")
      end
      
    end/

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, :notice => 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
  
  private

      def authenticate
        deny_access unless signed_in?
      end
      
      def correct_user
            
            $query = "event_id = %s" % params[:id]
            $temp = " AND user_id = %s" % @current_user.id
            
            $query.concat($temp)
            $temp = " AND admin = 1"
            $query.concat($temp)

            @currenteventusers = Usersevent.where($query)
            
            redirect_to('/events') if @currenteventusers.empty?
      end
  
end
