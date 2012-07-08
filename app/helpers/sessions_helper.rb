module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user) #set current_user
    @current_user = user
  end 

  def current_user #get current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    #short-circuit evaluation: set value if current_user is nil.
    # Need to persist current_user so that the view can use this as well.
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
