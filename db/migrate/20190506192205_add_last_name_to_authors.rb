class AddLastNameToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column(:authors, :last_name, :string)
  end
end
