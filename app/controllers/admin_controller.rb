class AdminController < ApplicationController
  include Admin::SessionsHelper
  layout 'admin/layouts/base'
  # sessions_controller以外に認証をかけている
  before_action :authenticate_manager, unless: :sessions_controller?
  private
    def authenticate_manager
      redirect_to admin_sign_in_path unless signed_in?
    end
    def sessions_controller?
      false
    end
end
