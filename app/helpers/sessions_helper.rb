module SessionsHelper
  
  def sign_in(user)
    cookies.permanent[:remember] = user.remember
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember(cookies[:remember])
  end
  
  def signed_in?
   current_user.nil?
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete :remember
  end
  def timeleft
    @timeleft = 10
  end
end
