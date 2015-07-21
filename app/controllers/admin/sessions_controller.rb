class Admin::SessionsController < AdminController
  def new
  end
  def create
    manager = Manager.find_by(email: params[:session][:email].downcase)
    if manager && manager.authenticate(params[:session][:password])
      #sign_in(manager)
      session[:manager_id] = manager.id
      redirect_to admin_root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  def destroy
    #sign_out
    reset_session
    redirect_to admin_sign_in_path
  end
  private
    def sessions_controller?
      true
    end
end
