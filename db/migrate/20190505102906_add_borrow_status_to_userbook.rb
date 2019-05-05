class AddBorrowStatusToUserbook < ActiveRecord::Migration[5.2]
  def change
    add_column :user_books, :possession, :string
  end
end
