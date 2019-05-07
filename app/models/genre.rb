class Genre < ActiveRecord::Base
    has_many :books
<<<<<<< HEAD
<<<<<<< HEAD
=======
    #has_many :authors, through: :books
>>>>>>> add_new_book_methods_to_book
=======
>>>>>>> add_new_book_methods_to_book
    has_many :users, through: :books

    def self.update_id
      # Updates all genres ID's
      all_genres = self.all.each do |genres|
        genres.id +=5
        genres.save
      end
    end

end
