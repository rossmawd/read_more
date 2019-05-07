class DeleteAuthorsAndRenameAuthorIdInBooks < ActiveRecord::Migration[5.2]
  def change
    drop_table :authors
    remove_column :books, :author_id
    add_column :books, :author, :string
  end
end
