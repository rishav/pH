class PizzaLocation < ActiveRecord::Base
  
  scope :featured, -> { where({featured: true})}
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  #ratyrate_rateable "overall"    
  validates_presence_of :name, :city, :address, :zipcode, :country
  
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

end
