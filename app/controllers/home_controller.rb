class HomeController < ApplicationController
  
  skip_before_action :authorized, only: [:login, :logout, :index]

  def index
    query = params[:query]
    if query
      @articles = helpers.get_articles(query);
    end
    # Caches the result here, so we can use it within the view file
    # It avoids doing many searches in our database
    @is_user_logged_in = is_user_logged_in?
  end

  def login
    is_login_successfull = false;
    username_received = params["username"];
    if username_received
      user = User.find_by_username(username_received)
      if user != nil
        # Tries to authenticate the user with the password received
        is_login_successfull = user.authenticate(params["password"]);
        if is_login_successfull
          session[:user_id] = user.id;
          redirect_to root_path;
        else
          fail_login
        end
      else
        fail_login
      end
    end
  end

  def fail_login
    # flash alert so we can keep the alert for the next view after the redirect
    flash.alert = "Username or password incorrect!";
    redirect_to "/home/login";
  end

  def logout
    session[:user_id] = nil;
  end

end
