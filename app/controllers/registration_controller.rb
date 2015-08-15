class RegistrationController < Devise::RegistrationsController
  
  protected
  def after_sign_up_path_for(resource)
    edit_user_registration_path   
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end

  private
  def account_update_params
    if resource.oauth_enabled?
      params.require(:user).permit(:name, :nickname, :email)
    else
      params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :current_password)
    end
  end
end
