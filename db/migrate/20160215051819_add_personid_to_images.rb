class AddPersonidToImages < ActiveRecord::Migration
  def change
    add_column :images, :person_id, :integer
    add_index :images, :person_id
  end
end
