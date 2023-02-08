module SessionsHelper
  # def log_in(user)
  #   session[:user_id] = user.id
  # end

  def current_user
    if (user_id = session[:user_id]) # knowsonly about the temporary session # not is a comparison
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.encrypted[:user_id])
      puts "-------------------"
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        # log_in user
        puts "-------------------login user"
        # cookies.permanent.encrypted[:user_id] = user.id
        # cookies.permanent[:remember_token] = user.remember_token
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    cookies.permanent.encrypted[:user_id] = nil
    cookies.permanent[:remember_token] = nil
  end

  def remember(user)
    user.remember
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
end
