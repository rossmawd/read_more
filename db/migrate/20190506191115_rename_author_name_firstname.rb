class RenameAuthorNameFirstname < ActiveRecord::Migration[5.2]
  def change
     rename_column :authors, :name, :first_name
  end
end
