class AddPrimaryToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :primary, :boolean
  end
end
