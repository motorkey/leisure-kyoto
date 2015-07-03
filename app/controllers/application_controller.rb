class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'bnbhost', password: 'kankou' if Rails.env == "production"

  # Herokuでは以下を使え！

  #http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD'] if Rails.env == "production"
  protect_from_forgery with: :exception
end
