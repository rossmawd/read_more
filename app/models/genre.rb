class Genre < ActiveRecord::Base
    has_many :books
    has_many :authors, through: :books
    has_many :users, through: :books
end
    
