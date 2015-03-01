class CreatePizzaLocations < ActiveRecord::Migration
  def change
    create_table :pizza_locations do |t|
      t.string :name
      t.text :address
      t.string :city
      t.integer :zipcode
      t.string :country
      t.text :specialities

      t.timestamps null: false
    end
  end
end
