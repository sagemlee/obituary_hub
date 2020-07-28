class Obituary < ApplicationRecord
  validates_presence_of :first_name, :last_name
  belongs_to :user
  before_save :default_image

  def name
    first_name + ' ' + last_name
  end

  def location
    city + ' ' + state
  end

  def date
    created_at.strftime("%B %-d, %Y")
  end

  private
  def default_image
    self.image_url ||= 'https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg'
  end

  def self.search_by_name(name)
    Obituary.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{name}%", "%#{name}%")
  end

end
