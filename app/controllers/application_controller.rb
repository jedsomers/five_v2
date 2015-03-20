class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :prepare_for_desktop
  layout :detect_browser
  
  
  private
  
   MOBILE_BROWSERS = ["android", "ipod", "opera mini", "blackberry", "palm","hiptop","avantgo","plucker", "xiino","blazer","elaine", "windows ce; ppc;", "windows ce; smartphone;","windows ce; iemobile", "up.browser","up.link","mmp","symbian","smartphone", "midp","wap","vodafone","o2","pocket","kindle", "mobile","pda","psp","treo"]

  def detect_browser
    agent = request.headers["HTTP_USER_AGENT"].downcase
    MOBILE_BROWSERS.each do |m|
      return "application" if agent.match(m)
    end
    return "desktop_application"
  end
  
  def desktop_device?
    if session[:desktop_param]
      session[:desktop_param] == '1'
    else
    request.user_agent !~ /Mobile|webOS/
    end
  end
  helper_method :desktop_device?
  
  def prepare_for_desktop
    session[:desktop_param] = params[:desktop] if params[:desktop]
    request.format = :desktop if desktop_device?
  end
  
  
  #Confirms a logged-in user
  def logged_in_user
    unless logged_in?
    store_location
    flash[:danger] = "Please log in."
    redirect_to login_url
    end
  end

end
