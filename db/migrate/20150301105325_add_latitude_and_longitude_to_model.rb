class AddLatitudeAndLongitudeToModel < ActiveRecord::Migration
  def change
    add_column :pizza_locations, :latitude, :float
    add_column :pizza_locations, :longitude, :float
  end
  
end
