class AddHuntersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :found_egg, :boolean, :default => false)
  end
end
