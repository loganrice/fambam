class RenamePasswordtoPasswordDigestinPeople < ActiveRecord::Migration
  def change
    rename_column :people, :password, :password_digest
  end
end
