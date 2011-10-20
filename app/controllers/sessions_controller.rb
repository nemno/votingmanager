class SessionsController < ApplicationController
  
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    
    if user.nil?
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
  
  def authenticate
      deny_access unless signed_in?
  end

  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end

end
