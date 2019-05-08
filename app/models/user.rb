class User < ActiveRecord::Base
  has_many :books
  has_many :user_books
  has_many :genres, through: :books
  has_many :books, through: :user_books

  def update_password(password)
    self.update(password: password)
  end

  def update_user(firstname, lastname, e_mail, age)
    self.update(first_name: firstname, last_name: lastname, email: e_mail, age: age)
  end

  def check_password
    prompt = TTY::Prompt.new
    password = prompt.mask('🔐   Please enter your password: ')
    if password == self.password
      puts "Welcome Back!"
      user = self
      main_menu
    else
      choice = prompt.select("Sorry, That password does not match our records. Would you like to try again?") do |a|
        a.choice 'Try Again'
        a.choice 'Back to the Start Menu'
      end
      if choice == 'Try Again'
        check_password
      elsif choice == 'Back to the Start Menu'
        start_menu
      end
    end
  end

  def self.users
    # List all users.
    self.all.map{|users| users.user_name}
  end

  def books
    # Returns book object of all books said user has created
    Book.all.select{|book| book.user_id == self.id}

  end

  def my_books_list
    counter = 0
    while self.books.length > counter
      puts "Book #{counter + 1}
      Title: #{self.books[counter].name}
      Author: #{self.books[counter].author}
      Synopsis: #{self.books[counter].synopsis}
      My Rating: #{self.reviews[counter].rating}
      My Review: #{self.reviews[counter].review}
      Current Location: #{self.reviews[counter].possession}\n"
      counter += 1
    end
    sleep 1
    books_names_inner_menu
  end

  def my_borrowed_books_list
    counter = 0
    while self.borrowed_books.length > counter
      puts "Book #{counter + 1}
      Title: #{self.borrowed_books[counter].name}
      Author: #{self.borrowed_books[counter].author}
      Synopsis: #{self.borrowed_books[counter].synopsis}
      My Rating: #{self.borrowed_book_reviews[counter].rating}
      My Review: #{self.borrowed_book_reviews[counter].review}
      Current Location: #{self.borrowed_book_reviews[counter].possession}\n"
      counter += 1
    end
    sleep 1
    books_names_inner_menu
  end

  def books_by_title_only
    self.books.map{|books| books.name}
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
    self.reviewed_books-self.books
  end

  def borrowed_book_reviews
    # Returns user_book object of all books said user has borrowed
    User_Book.all.select{|userbook| userbook.user_id == self.id && userbook.book.user_id != self.id}
  end

  def borrowed_books_names
    self.borrowed_books.map{|books| books.name}.join(", ")
  end

  def sort_by_rating
    User_Book.rating_desc.select{|userbook| userbook.user == self}
  end

  def completed?
    User_Book.completed?.select{|userbook| userbook.user_id == self.id}
  end

  def not_started
    User_Book.not_started.select{|userbook| userbook.user_id == self.id}
  end

  def abandoned
    User_Book.abandoned.select{|userbook| userbook.user_id == self.id}
  end

  def reading
    User_Book.reading.select{|userbook| userbook.user_id == self.id}
  end

  def must_return
    ### Add an if statment to say none if none.
    self.borrowed_book_reviews-User_Book.possession_others
  end

  def self.update_id
    # Updates all books ID's
    all_users = self.all.each do |users|
      users.id +=10
      users.save
    end
  end

  def add_a_new_book_manually
    # This will allow the user to add a new book to there library
    prompt = TTY::Prompt.new

    puts "The more that you read, the more things you will know. The more that you learn, the more places you’ll go. – Dr. Seuss"
    sleep 0.5

    answers = prompt.collect do
      key(:book_name).ask('Title: ')
      key(:book_synopsis).ask('Synopsis: ')
      key(:book_author).ask('Author: ')
      key(:book_isbn).ask('ISBN Number')
    end

    user = self
    book = Book.create(name: answers[:book_name], synopsis: answers[:book_synopsis], author: answers[:book_author], user_id: user.id, isbn_13: answers[:book_isbn])

    selection = prompt.select("Where to next?") do |a|
       a.choice '📚  Review This Book'
       a.choice '📚  Main Menu'
       a.choice ''
       a.choice '❌  Exit'
     end

     case selection
     when '📚  Review this Book'
         puts "You are going to review the book you just made"
         main_menu
       when '📚  Main Menu'
         main_menu
       when '❌  Exit'
         exit
     end
  end

  def review_a_new_book
    # Will allow the user to review a book
    puts "Lets begin..."
    sleep 0.5


    # User_Book.create(user_id: 6, book_id: 1, read_status: "Completed", page_number: 732, rating: 5, review: "AMAZING!!!", possession: "On The Shelf")

  end


  ####Ross's Methods Below!


end
