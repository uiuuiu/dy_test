class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    session[:redirect_uri] || stored_location_for(resource) || root_path
  end
end