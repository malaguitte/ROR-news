class HomeController < ApplicationController
  
  skip_before_action :authorized, only: [:login, :logout, :index]

  def index
    query = params[:query]
    @articles = helpers.fetch_articles(query: query) if query.present?
    # Caches the result here, so we can use it within the view file
    # It avoids doing many searches in our database
    @user_logged_in = user_logged_in?
  end

  def login
    username_received = params['username']
    if username_received
      user = User.find_by_username(username_received)
      return fail_login unless user.present?

      # Tries to authenticate the user with the password received
      login_ok = user.authenticate(params['password'])
      return fail_login unless login_ok

      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def fail_login
    # flash alert so we can keep the alert for the next view after the redirect
    flash.alert = 'Username or password incorrect!'
    redirect_to '/home/login'
  end

  def logout
    session[:user_id] = nil;
  end

end
