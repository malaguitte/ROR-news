class UsersController < ApplicationController
  
  def index
    @users = User.all;
  end

  def new
    @user = User.new;
  end

  def create
    @user = User.new(user_params);
    if @user.save
      flash.alert = "User created successfully.";
      redirect_to @user;
    else 
      flash.alert = "Error creating new user";
      redirect_to new_user_path, alert: @user.errors.full_messages;
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password);
  end

  def show
    @user = User.find(params[:id]);
  end

end
