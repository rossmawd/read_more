class Book < ActiveRecord::Base
    has_many :user_books 
    has_many :user_books, through: :user_books
    belongs_to :users
    belongs_to :authors
    belongs_to :genres
end
    
