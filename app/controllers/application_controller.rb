class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resources)
    flash[:success] = "Welcome! You have signed up successfully."
    user_path(current_user.id)
  end

  def after_sign_up_path_for(resources)
    flash[:success] = "Signed in successfully."
    user_path(current_user.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:update, keys: [:name, :intorduction, :profile_image])

  end

end
