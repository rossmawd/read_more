class Author < ActiveRecord::Base
    has_many :books
    has_many :genres, through: :books
    has_many :users, through: :books

    def self.update_id
      # Updates all authors ID's
      all_authors = self.all.each do |authors|
        authors.id +=5
        authors.save
      end
    end
end
