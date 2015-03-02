class AddFeaturedAtToPizzaLocation < ActiveRecord::Migration
  def change
    add_column :pizza_locations, :featured_at, :datetime
  end
end
