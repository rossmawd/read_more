class Author < ActiveRecord::Base
    has_many :books
    has_many :genres, through: :books
    has_many :users, through: :books
    
end
    
