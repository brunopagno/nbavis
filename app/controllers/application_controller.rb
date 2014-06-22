class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :devise_parameter_sanitizer, if: :devise_controller?

  private

  def devise_parameter_sanitizer
    if resource_class == User
      Devise::UserParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end
end
