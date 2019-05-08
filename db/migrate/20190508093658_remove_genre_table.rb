class RemoveGenreTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :genres
  end
end
