class User_Book < ActiveRecord::Base
    belongs_to :book
    belongs_to :user

    def self.rating_desc
      # Returns objects in order of highest rated to lowest
      self.all.order(rating: :desc)
    end

    def self.rating_asc
      # Returns objects in order of lowest rated to highest
      self.all.order(:rating)
    end

    def self.completed?
      # Returns all book objects that have been completed
      self.all.select{|userbook| userbook.read_status == "Completed"}
    end

    def self.not_started
      # Returns all book objects yet to be started
      self.all.select{|userbook| userbook.read_status == "Not Started"}
    end

    def self.abandoned
      # Returns all books objects that have been abandoned
      self.all.select{|userbook| userbook.read_status == "Abandoned"}
    end

    def self.reading
      # Returns all book objects that are currently being read
      self.all.select{|userbook| userbook.read_status == "Reading"}
    end

    def self.reading_mine
      self.all.select{|userbook| userbook.reading.user.id == user.id}
    end




    def self.update_id
      # Updates all user_books ID's
      all_user_books = self.all.each do |user_books|
        user_books.id +=10
        user_books.save
      end
    end

end
