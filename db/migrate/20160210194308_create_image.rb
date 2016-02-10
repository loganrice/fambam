class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :attachments
      t.text :label
      t.timestamps
    end
  end
end
