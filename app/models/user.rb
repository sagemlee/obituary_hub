class User < ApplicationRecord
  validates :email, uniqueness:true, presence:true
  validates_presence_of :first_name, :last_name
  has_many :obituaries

  has_secure_password validates: false

  def has_obituary?(obituary)
    obituaries.include?(obituary)
  end

  def self.create_with_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.fbid = auth.uid
      user.first_name = auth.info.first_name 
      user.last_name = auth.info.last_name 
      user.email = auth.info.email 
      user.token = auth.credentials.token
    end
  end 

end
