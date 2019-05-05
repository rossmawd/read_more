class User < ActiveRecord::Base
    has_many :books
    has_many :user_books
    has_many :genres, through: :books
    has_many :authors, through: :books
    has_many :books, through: :user_books

  def books
    # Returns book object of all books said user has created
    Book.all.select{|book| book.user.id == self.id}
  end

  def reviews
    # Returns user_book (review) object of all books said user has reviewed
    User_Book.all.select{|userbook| userbook.user_id == self.id}
  end

  def reviewed_books
    # Returns the book object of all books said user has reviewed
    self.reviews.map{|reviews| reviews.book}
  end

  def borrowed_books
    # Returns book object of all books said user has borrowed
    answer = self.reviewed_books-self.books
    answer.map{|answers| answers.book}
  end

  def borrowed_books_names
    self.borrowed_books.map{|books| books.name}.join
  end

  def self.update_id
    # Updates all books ID's
    all_users = self.all.each do |users|
      users.id +=10
      users.save
    end
  end
end
