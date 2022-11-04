class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :store_location

  def store_location
    if params[:continue]
      session[:continue] = params[:continue]
    end
  end

  def after_sign_in_path_for(_resource)
    session.delete(:continue) || root_path
  end



  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :fuel, :birthday, :address, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :fuel, :birthday, :address, :photo])
  end
end
