class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :streams

  def self.from_omniauth(auth)
    User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.id = auth.id
      user.nickname = auth.info.nickname
    end
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
    super && provider.blank?
  end
  
  def email_required?
    super && provider != 'twitter'
  end
end
