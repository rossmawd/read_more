class User < ActiveRecord::Base
    has_many :books
    has_many :user_books
    has_many :genres, through: :books
    has_many :authors, through: :books
    has_many :books, through: :user_books

  def books
    # Returns all books said user has created therefor owns
    Book.all.select{|book| book.users == self}
  end

  def self.update_id
    # Updates all books ID's
    all_users = self.all.each do |users|
      users.id +=10
      users.save
    end
  end
end
