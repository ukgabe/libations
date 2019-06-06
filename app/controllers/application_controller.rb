class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:username, :comment_count, :likes_count])

    devise_parameter_sanitizer.permit(:account_update, :keys => [:username, :comment_count, :likes_count])
  end
end
