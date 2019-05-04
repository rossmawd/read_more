class CreateUserBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_books do |t|
      t.text :review
      t.integer :rating 
      t.integer :page_number 
      t.string :read_status
      t.timestamps 
      t.integer :book_id
      t.integer :user_id
      
    end

  end
end
