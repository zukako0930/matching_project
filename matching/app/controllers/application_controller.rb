class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  def signed_in?
    current_user
  end
  def sec_signout
    redirect_to controller:'sessions',acion:'new'
  end

end
