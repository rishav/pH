class PizzaLocation < ActiveRecord::Base
  
  scope :featured, -> { where({featured: true})}
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  ratyrate_rateable "overall"
  validates_presence_of :name, :city, :address, :zipcode, :country
  
  has_many :photos
  has_one :primary_photo, -> { where(primary: true) }, :class_name => "Photo"
  
  accepts_nested_attributes_for :photos,:reject_if => lambda { |photo| photo[:image].blank? }, :allow_destroy => true
    
  geocoded_by :complete_address  
  after_validation :geocode
  
  def complete_address
    [address, city, zipcode, country].compact.join(', ')
  end
  
  def feature!
    self.featured = true
    self.featured_at = Time.now
    save
  end
  
  def primary_photo_url(type)
    return primary_photo.image.url(type) if primary_photo
    return photos.first.image.url(type) unless photos.blank?
    return Photo.new.image.url(type)
  end  

end
