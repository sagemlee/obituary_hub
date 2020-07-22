class User < ApplicationRecord
  validates :email, uniqueness:true, presence:true
  validates_presence_of :first_name, :last_name, :password

  has_secure_password

  def self.create_from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      #user.uid = auth.uid

      user.first_name = auth.info.first_name 
      user.last_name = auth.info.last_name 
      user.email = auth.info.email 
      user.password = "password"
    end
  end 
end
