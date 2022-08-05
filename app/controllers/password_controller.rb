class PasswordController < ApplicationController
  
  def reset
    token_received = request.query_parameters['token'] || params['token'] || not_found
    # Tries to find the user based on the token received.
    @user = User.find_by_reset(token_received) || not_found
    password_received = params['password']
    return unless password_received

    # Updates the password & saves the user record.
    @user.password = password_received
    @user.save
    render plain: 'Successfully reset password'
  end

  def forgot
    email_received = params['email']
    return post_reset_page unless email_received

    user = User.find_by_email(email_received)
    return post_reset_page unless user

    # Generate a 15 digit secure token
    token = SecureRandom.hex(15)
    # Assign it to the user & saves the record.
    user.reset = token
    user.save
    ResetMailer.with(user: user).reset_password.deliver_now

    post_reset_page
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private
  def post_reset_page
    render plain: 'A link to reset the password has been sent to your email if it exists'
  end

end
