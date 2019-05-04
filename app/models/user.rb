class User < ActiveRecord::Base
    has_many :books
    has_many :user_books
    has_many :genres, through: :books
    has_many :authors, through: :books
    has_many :books, through: :user_books
end
    
