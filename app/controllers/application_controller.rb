class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_for_mobile

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
end
