class User < ActiveRecord::Base

  extend OmniauthHelpers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :identity

  def self.from_omniauth(auth)
    identity = Identity.for_omniauth(auth)
    
    if identity.present?
      user = identity.user
    else
      user = User.new()
      set_params_for_user_by_identity(user, auth)
      user.save!
    end
    user
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["device.user_attributes"], without_protection: false) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end


  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  protected
  def password_required?
    super && self.identity.provider.blank?
  end
  
  def email_required?
    super && self.identity.provider.blank?
  end

  private

  def self.set_params_for_user_by_identity(user, auth)
    if auth.provider == 'twitter'
      set_user_params_from_twiter(user, auth)
    elsif auth.provider == 'facebook'
      set_user_params_from_facebook(user, auth)
    else
      #do nothing
    end
  end

end
