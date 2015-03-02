class AddFeaturedToPizzaLocation < ActiveRecord::Migration
  def change
    add_column :pizza_locations, :featured, :boolean
  end
end
