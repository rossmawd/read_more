class Genre < ActiveRecord::Base
    has_many :books
    #has_many :authors, through: :books
    has_many :users, through: :books

    def self.update_id
      # Updates all genres ID's
      all_genres = self.all.each do |genres|
        genres.id +=5
        genres.save
      end
    end

end
