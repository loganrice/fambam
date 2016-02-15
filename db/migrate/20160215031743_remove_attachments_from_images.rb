class RemoveAttachmentsFromImages < ActiveRecord::Migration
  def change
    remove_column :images, :attachments, :string
  end
end
