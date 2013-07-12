class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_id(params[:id])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "로그인 되었습니다"
    else
      flash.now.alert = "아이디나 패스워드가 잘못되었습니다"
    end
  end
end
