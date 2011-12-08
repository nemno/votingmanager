class UserseventsController < ApplicationController
  # GET /usersevents
  # GET /usersevents.json
  def index
    @usersevents = Usersevent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @usersevents }
    end
  end

  # GET /usersevents/1
  # GET /usersevents/1.json
  def show
    @usersevent = Usersevent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @usersevent }
    end
  end

  # GET /usersevents/new
  # GET /usersevents/new.json
  def new
    @usersevent = Usersevent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @usersevent }
    end
  end

  # GET /usersevents/1/edit
  def edit
    @usersevent = Usersevent.find(params[:id])
  end

  # POST /usersevents
  # POST /usersevents.json
  def create
    @usersevent = Usersevent.new(params[:usersevent])

    respond_to do |format|
      if @usersevent.save
        format.html { redirect_to @usersevent, :notice => 'Usersevent was successfully created.' }
        format.json { render :json => @usersevent, :status => :created, :location => @usersevent }
      else
        format.html { render :action => "new" }
        format.json { render :json => @usersevent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usersevents/1
  # PUT /usersevents/1.json
  def update
    @usersevent = Usersevent.find(params[:id])

    respond_to do |format|
      if @usersevent.update_attributes(params[:usersevent])
        format.html { redirect_to @usersevent, :notice => 'Usersevent was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @usersevent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usersevents/1
  # DELETE /usersevents/1.json
  def destroy
    @usersevent = Usersevent.find(params[:id])
    @usersevent.destroy

    respond_to do |format|
      format.html { redirect_to usersevents_url }
      format.json { head :ok }
    end
  end
end
