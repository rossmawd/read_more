class User_Book < ActiveRecord::Base
    belongs_to :book
    belongs_to :user

    def self.update_id
      # Updates all user_books ID's
      all_user_books = self.all.each do |user_books|
        user_books.id +=10
        user_books.save
      end
    end

end
