class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      remember user 
      redirect_to user_url(user)
    else
      # Create an error message.
      flash.now[:danger] = "Invalid email/password combination" # Not quite right!
      render "new"
    end
  end

  def destroy
    forget(current_user)
    log_out
    redirect_to root_url
  end

  
end
