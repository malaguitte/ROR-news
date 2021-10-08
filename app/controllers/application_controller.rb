class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # redirects the user if not logged in
  before_action :authorized
  helper_method :get_current_user
  helper_method :is_user_logged_in?

  def get_current_user
    return User.find_by_id(session[:user_id])
  end

  def is_user_logged_in?
    return get_current_user != nil
  end

  def authorized
    redirect_to "/home/login" unless is_user_logged_in?
  end

end
