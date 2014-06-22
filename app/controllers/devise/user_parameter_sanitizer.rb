class Devise::UserParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:name, :email, :password, :password_confirmation)
  end

  def sign_in
    default_params.permit(:email, :password)
  end

  def account_update
    default_params.permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end