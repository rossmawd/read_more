class Book < ActiveRecord::Base
  has_many :user_books
  has_many :users, through: :user_books
  belongs_to :user


  #HELPER: sort all Author instances by FIRSTname alphabetically
  def self.all_authors_sorted
    Author.all.order(:first_name)
  end

  #returns book instances sorted by author FIRSTname
  def self.sort_by_author
    all_authors_sorted.map { |author| author.books}
  end

  # def self.all_genres_sorted #HELPER
  #   Genre.all.order(:name)
  # end


  # def self.sort_by_genre
  #     #returns Book instances sorted by genre alphabetically. USEFUL?
  #   all_genres_sorted.map {|genre| genre.books}
  # end


  # def self.find_by_genre(genre)
  #     #Is passed a string argument; returns all instances of Book in that genre
  #   genre = Genre.all.find_by(name: genre)
  #   genre.books
  # end
end
