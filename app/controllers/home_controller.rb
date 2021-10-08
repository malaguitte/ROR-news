class HomeController < ApplicationController
  
  skip_before_action :authorized, only: [:login, :logout, :index]

  def index
    query = params[:query]
    if query
      @articles = helpers.get_articles(query);
    end
  end

  def login
    @is_login_successfull = false;
    username_received = params["username"];
    if username_received
      user = User.find_by_username(username_received)
      if user != nil
        # Tries to authenticate the user with the password received
        @is_login_successfull = user.authenticate(params["password"]);
        if @is_login_successfull
          session[:user_id] = user.id
          redirect_to root_path
        end
      end
    end
  end

  def logout
    session[:user_id] = nil;
  end

end
