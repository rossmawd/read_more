class Book < ActiveRecord::Base
  has_many :user_books
  has_many :users, through: :user_books
  belongs_to :user
<<<<<<< HEAD
<<<<<<< HEAD
=======
  #belongs_to :author
>>>>>>> add_new_book_methods_to_book
=======
>>>>>>> add_new_book_methods_to_book
  belongs_to :genre


  #HELPER: sort all Author instances by FIRSTname alphabetically
  def self.all_authors_sorted
    Author.all.order(:first_name)
  end

  #returns book instances sorted by author FIRSTname
  def self.sort_by_author
    all_authors_sorted.map { |author| author.books}
  end

  def self.all_genres_sorted #HELPER
    Genre.all.order(:name)
  end

  #returns Book instances sorted by genre alphabetically. USEFUL?
  def self.sort_by_genre
    all_genres_sorted.map {|genre| genre.books}
  end

  #Is passed a string argument; returns all instances of Book in that genre
  def self.find_by_genre(genre)
    genre = Genre.all.find_by(name: genre)
    genre.books
  end
end
