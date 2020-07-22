class Obituary < ApplicationRecord
  validates_presence_of :first_name, :last_name
  belongs_to :user
  before_save :default_image

  private
  def default_image
    self.image_url ||= 'https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg'
  end
end
