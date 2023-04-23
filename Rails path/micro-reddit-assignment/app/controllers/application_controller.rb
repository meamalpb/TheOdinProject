class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :public_page?

  before_action :configure_permitted_parameters, if: :devise_controller?

  def public_page?
    request.path == root_path
  end
  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

  end
end
