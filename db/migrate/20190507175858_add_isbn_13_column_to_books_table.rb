class AddIsbn13ColumnToBooksTable < ActiveRecord::Migration[5.2]
  def change
    add_column(:books, :isbn_13, :integer,:default => nil)
  end
end
