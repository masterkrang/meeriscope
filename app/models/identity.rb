class Identity < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  
  def self.for_omniauth(auth)
    find_by(uid: auth.uid, provider: auth.provider)
  end

end
