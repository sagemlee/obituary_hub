class Obituary < ApplicationRecord
  validates_presence_of :first_name, :last_name
  belongs_to :user
  before_save :default_image

  private
  def default_image
    self.image_url ||= '/thumbnail_logo.png'
  end
end
