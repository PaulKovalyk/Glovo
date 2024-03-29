# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  def routing_error
    redirect_to user_session_path
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_back(fallback_location: root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name email owner avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name email avatar remove_avatar])
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
