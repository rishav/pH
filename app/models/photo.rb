class Photo < ActiveRecord::Base
  belongs_to :pizza_location
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "140x140>" }, :default_url => "/images/missing_:style.png"

end
