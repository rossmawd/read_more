class Book < ActiveRecord::Base
    has_many :user_books
    has_many :users, through: :user_books
    belongs_to :user
    belongs_to :author
    belongs_to :genre
end
