class HomeController < ApplicationController
  
  def index
    p params;
  end

  def login
    @isLoginSuccessful = false;
    usernameReceived = params["username"];
    if usernameReceived
      user = User.find_by_username(usernameReceived)
      if user != nil
        # Tries to authenticate the user with the password received
        @isLoginSuccessful = user.authenticate(params["password"]);
      end
    end

  end

end
