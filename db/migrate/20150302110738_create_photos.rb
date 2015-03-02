class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :pizza_location, index: true
      t.timestamps null: false
    end
    add_attachment :photos, :image
    add_foreign_key :photos, :pizza_locations
  end
end
