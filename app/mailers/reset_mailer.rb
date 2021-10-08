class ResetMailer < ApplicationMailer
  
  def reset_password
    # Get user received
    @user = params[:user]
    user_token = @user.reset
    @url = "#{password_reset_path}?token=#{user_token}";
    mail(to: @user.email, subject: "Reset password for News App");
  end

end
