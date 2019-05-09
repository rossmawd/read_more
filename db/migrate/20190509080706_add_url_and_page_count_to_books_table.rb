class AddUrlAndPageCountToBooksTable < ActiveRecord::Migration[5.2]
  def change
    add_column(:books, :url, :text, :default => "www.google.com" ) #null => false stops it having a null value
    add_column(:books, :page_count, :integer, :default => 0)
  end
end
