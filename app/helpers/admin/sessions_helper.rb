module Admin::SessionsHelper
  #
  # Rails Tutorialのやり方でできないから、実質signed_in?しか使ってない
  #
  def sign_in(manager)
    remember_token = Manager.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    manager.update_attribute(:remember_token, Manager.encrypt(remember_token))
    self.current_manager = manager
  end
  def signed_in?
    !!session[:manager_id]
    #!current_manager.nil?
  end
  def current_manager=(manager)
    @current_manager = manager
  end
  def current_manager?
    remember_token = Manager.encrypt(cookies[:remember_token])
    @current_manager ||= Manager.find_by(remember_token: remember_token)
  end
  def sign_out
    self.current_manager = nil
    cookies.delete(:remember_token)
    session
  end
end
