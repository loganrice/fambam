class ChangeDefaultsToRequiredFields < ActiveRecord::Migration
  def change
    change_column :people, :email, :string, :null => false
    change_column :people, :password_digest, :string, :null => false
  end
end
