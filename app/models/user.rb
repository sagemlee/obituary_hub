class User < ApplicationRecord
  validates :email, uniqueness:true, presence:true
 # validates_presence_of :first_name, :last_name, :password

  validates :email, uniqueness: true, presence: true
  validates :first_name, :last_name, presence: true
  validates :password, presence: true, allow_nil: true, if: :create_from_omniauth


  has_secure_password

  def self.create_from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      #user.uid = auth.uid
      user.first_name = auth.info.first_name 
      user.last_name = auth.info.last_name 
      user.email = auth.info.email 
      user.refresh_token = auth.credentials.refresh_token
    end
  end 
end
