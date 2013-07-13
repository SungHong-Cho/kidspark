class ApplicationController < ActionController::Base
  protect_from_forgery
 # before_filter :prepare_for_mobile

  private
  def mobile_device?
    if session[:mobile_parameter]
      session[:mobile_parameter] == "1"
    else
      request.env['mobvious.device_type'] == :mobile
    end
  end

  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_parameter] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

  def current_user
    @current_user ||= User.where(:name => session[:user_id]).first if session[:user_id]
  end
  helper_method :current_user

  def authenticate(name, password)
    user = User.where(:name => name).first
    if user.password == password
      return true
    else
      return false
    end
  end

end
