class CreatePerson < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
