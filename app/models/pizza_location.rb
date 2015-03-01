class PizzaLocation < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged
    
  validates_presence_of :name, :city, :address, :zipcode, :country
  
  geocoded_by :complete_address  
  after_validation :geocode
  
  def complete_address
    [address, city, zipcode, country].compact.join(', ')
  end

end
