class AddSlugToPizzaLocation < ActiveRecord::Migration
  def change
    add_column :pizza_locations, :slug, :string
    add_index :pizza_locations, :slug, unique: true
  end
end
