class User < ActiveRecord::Base
  has_many :books #does this create a .books mthod that will interfere with below
  has_many :user_books
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
      Genre: #{self.books[counter].genre}
      ISBN Number: #{self.books[counter].isbn_13}
      Read Status: #{self.reviews[counter].read_status}
      Current Page Number: #{self.reviews[counter].page_number}
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
      Genre: #{self.borrowed_books[counter].genre}
      ISBN Number: #{self.borrowed_books[counter].isbn_13}
      Read Status: #{self.borrowed_book_reviews[counter].read_status}
      Current Page Number: #{self.borrowed_book_reviews[counter].page_number}
      My Rating: #{self.borrowed_book_reviews[counter].rating}
      My Review: #{self.borrowed_book_reviews[counter].review}
      Current Location: #{self.borrowed_book_reviews[counter].possession}
      Book Owner: #{borrowed_book_reviews[counter].user.first_name}\n"

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
      key(:book_author).ask('Author: ')
      key(:book_synopsis).ask('Synopsis: ')
      key(:genre).ask('Genre: ')
      key(:book_isbn).ask('ISBN Number: ')
      key(:read_status).select('Read Status: ', %w(Unopened Completed Reading Abandoned))
      key(:page_num).ask('Current Page Number: ')
      key(:rating).ask('Rating: ')
      key(:review).ask('Review: ')
      key(:possession).select('Location: ') do |a|
        a.choice 'On The Shelf'
        a.choice 'Off The Shelf'
      end
    end

    user = self
    book = Book.create(name: answers[:book_name], genre: answers[:genre], synopsis: answers[:book_synopsis], author: answers[:book_author], user_id: user.id, isbn_13: answers[:book_isbn])
    review = User_Book.create(user_id: user.id, book_id: book.id, read_status: answers[:read_status], page_number: answers[:page_num], rating: answers[:rating], review: answers[:review], possession: answers[:possession])
    sleep 0.5
    puts "Great! That book has been added to your library, take a look:"
    sleep 0.5
    puts "Title: #{answers[:book_name]}
    Author: #{answer[:book_author]}
    Synopsis: #{answer[:book_synopsis]}
    Genre: #{answer[:genre]}
    ISBN Number: #{answer[:book_isbn]}
    Read Status: #{answers[:read_status]}
    Current Page Number: #{answers[:page_num]}
    My Rating: #{answers[:rating]}
    My Review: #{answers[:review]}
    Current Location: #{answers[:possession]}\n"


    selection = prompt.select("Where to next?") do |a|
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

     def select_book
       prompt = TTY::Prompt.new
       counter = 0
       while self.books.length > counter
         puts "Book #{counter + 1}
         Title: #{self.books[counter].name}
         Author: #{self.books[counter].author}
         Synopsis: #{self.books[counter].synopsis}
         Genre: #{self.books[counter].genre}
         ISBN Number: #{self.books[counter].isbn_13}
         Read Status: #{self.reviews[counter].read_status}
         Current Page Number: #{self.reviews[counter].page_number}
         My Rating: #{self.reviews[counter].rating}
         My Review: #{self.reviews[counter].review}
         Current Location: #{self.reviews[counter].possession}\n"
         counter += 1
       end
       answer = prompt.ask('Which book number would you like to edit?', convert: :int)

       book = self.books[answer-1]
       review = self.reviews[answer-1]
       update_book(book, review, answer)
     end

     def update_book(book, review, answer)
       prompt = TTY::Prompt.new
       puts "Great, we will be editing #{book.name}"

       selection = prompt.multi_select("Select all the fields you would like to update: ") do |a|
          a.choice 'Title'
          a.choice 'Author'
          a.choice 'Synopsis'
          a.choice 'Genre'
          a.choice 'ISBN Number'
          a.choice 'Read Status'
          a.choice 'Current Page Number'
          a.choice 'My Rating'
          a.choice 'My Review'
          a.choice 'Current Location'
        end

        selection.each do |choice|
          case choice
          when ("Title")
            a1 = prompt.ask('Update the title: ')
            book.name = a1
          when ("Author")
            a2 = prompt.ask('Update the Author: ')
            book.author = a2
          when ("Synopsis")
            a3 = prompt.ask('Update the Synopsis: ')
            book.synopsis = a3
          when ("Genre")
            a4 = prompt.ask('Update the Genre: ')
            book.genre = a4
          when ("ISBN Number")
            a5 = prompt.ask('Update the ISBN Number: ')
            book.isbn_13 = a5
          when ("Read Status")
            a6 = prompt.select('Update you reading status: ', %w(Unopened Completed Reading Abandoned))
            review.read_status = a6
          when ("Current Page Number")
            a7 = prompt.ask('Update your current page number: ')
            review.page_number = a7
          when ("My Rating")
            a8 = prompt.ask('Update your rating for this book: ')
            review.rating = a8
          when ("My Review")
            a9 = prompt.ask('Update your review: ')
            review.review = a9
          when ("Current Page Number")
            a10 = prompt.select('Update the books location: ') do |a|
              a.choice 'On The Shelf'
              a.choice 'Off The Shelf'
            end
            review.possession = a10
          end
          book.save
          review.save
        end
        sleep 0.5
        display_book(answer-1)
     end

     def display_book(locator)
       prompt = TTY::Prompt.new
       puts "📚  Your book has been updated!
       Title: #{self.books[locator].name}
       Author: #{self.books[locator].author}
       Synopsis: #{self.books[locator].synopsis}
       Genre: #{self.books[locator].genre}
       ISBN Number: #{self.books[locator].isbn_13}
       Read Status: #{self.reviews[locator].read_status}
       Current Page Number: #{self.reviews[locator].page_number}
       My Rating: #{self.reviews[locator].rating}
       My Review: #{self.reviews[locator].review}
       Current Location: #{self.reviews[locator].possession}\n"
       sleep 0.5
       main_menu
     end

  ####Ross's Methods Below!

  def select_book_to_delete
    prompt = TTY::Prompt.new
    counter = 0
    while self.books.length > counter
      puts "Book #{counter + 1}
      Title: #{self.books[counter].name}
      Author: #{self.books[counter].author}
      Synopsis: #{self.books[counter].synopsis}
      Genre: #{self.books[counter].genre}
      ISBN Number: #{self.books[counter].isbn_13}
      Read Status: #{self.reviews[counter].read_status}
      Current Page Number: #{self.reviews[counter].page_number}
      My Rating: #{self.reviews[counter].rating}
      My Review: #{self.reviews[counter].review}
      Current Location: #{self.reviews[counter].possession}\n"
      counter += 1
    end
    answer = prompt.ask('Which book number would you like to delete?', convert: :int)

    book = self.books[answer-1]
    review = self.reviews[answer-1]
    delete_book(book, review)
  end

  #Takes in an instance of a book, checks if the user created that book
  #(i.e owns the book) and destorys it AND it's User_Book entry
    def delete_book(book_instance, review_instance)
      if self.books.include?(book_instance)
        book_id = book_instance.id
        book_instance.destroy
        puts "#{book_instance.name} deleted!"
        user_book =  User_Book.find_by(book_id: book_id)
        user_book.destroy
      else
        puts "You do not own this book!"
      end
    end

  end
