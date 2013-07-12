class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(:name => params[:name]).first
    if user && authenticate(user.name, params[:password])
      session[:user_id] = user.name
      redirect_to root_url, notice: "Log in Success"
    else
      #redirect_to login_path 
    end
  end
  
  def destory
    session[:user_id] = nil
    redirect_to root_url, notice: "Log Out"
  end
end
