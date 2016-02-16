class AddPlacesToImages < ActiveRecord::Migration
  def change
    add_column :images, :city, :string
    add_index :images, :city
    add_column :images, :state, :string
    add_index :images, :state
    add_column :images, :country, :string
    add_index :images, :country
    add_column :images, :latitude, :string
    add_column :images, :longitude, :string

  end
end
