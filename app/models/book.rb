class Book < ActiveRecord::Base
    has_many :user_books
    has_many :users, through: :user_books
    belongs_to :user
    belongs_to :author
    belongs_to :genre

    #Returns User instance of the owner of the book
    # def owner
    #     User.all.select {|user| user.id == self.user_id}
    # end
   
    #sort all Author instances by Surname alphabetically
    def self.all_authors_ordered
       #all.map{ |book| book.author }
       Author.all.order(:name)
    end
    
    #returns book instances sorted by author Surname
    def self.sort_by_author
      all_authors_ordered.map { |author| author.books}
    end




end
