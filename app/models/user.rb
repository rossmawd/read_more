class User < ActiveRecord::Base
  has_many :books #does this create a .books mthod that will interfere with below
  has_many :user_books
  has_many :books, through: :user_books

  def update_password(password)
    # Called from CREATE_ACCOUNT
    self.update(password: password)
  end

  def update_user(firstname, lastname, e_mail, age)
    # Called from CREATE_ACCOUNT
    self.update(first_name: firstname, last_name: lastname, email: e_mail, age: age)
  end

  def check_password
    # Called from LOGIN method
    prompt = TTY::Prompt.new

    password = prompt.mask('🔐   Please enter your password: ')
    if password == self.password
      puts "Welcome Back!"
      user = self
      Cli.main_menu
    else
      Cli.line
      choice = prompt.select("Sorry, That password does not match our records. Would you like to try again?") do |a|
        a.choice 'Try Again'
        a.choice 'Back to the Start Menu'
      end
      if choice == 'Try Again'
        check_password
      elsif choice == 'Back to the Start Menu'
        Cli.line
        Cli.start_menu
      end
    end
  end

  def my_books_list
    # Called from MAIN_MENU and BORROWED_BOOKS_INNER_MENU
    pastel = Pastel.new
    Cli.clear
    Cli.bookcase
    Cli.quotation
    Cli.line
    counter = 0
    while self.books.length > counter
      puts pastel.decorate("Book #{counter + 1}\n", :red, :bold)+
      pastel.cyan("Title: ")+"#{self.books[counter].name}\n"+
      pastel.cyan("Author: ")+"#{self.books[counter].author}\n"+
      pastel.cyan("Synopsis: ")+"#{self.books[counter].synopsis}\n"+
      pastel.cyan("Genre: ")+"#{self.books[counter].genre}\n"+
      pastel.cyan("ISBN Number: ")+"#{self.books[counter].isbn_13}\n"+
      pastel.cyan("Read Status: ")+"#{self.reviews[counter].read_status}\n"+
      pastel.cyan("Current Page Number: ")+"#{self.reviews[counter].page_number}\n"+
      pastel.cyan("My Rating: #{Cli.stars(self.reviews[counter].rating)}\n") +
      pastel.cyan("My Review: ")+"#{self.reviews[counter].review}\n"+
      pastel.cyan("Current Location: ")+"#{self.reviews[counter].possession}\n"
      counter += 1
      Cli.line
      sleep 0.2
    end
    sleep 0.5
    Cli.books_names_inner_menu
  end

  def my_borrowed_books_list
    # Called from MAIN_MENU and OWN_BOOKS_INNER_MENU
    pastel = Pastel.new
    Cli.clear
    Cli.bookcase
    Cli.quotation
    Cli.line
    counter = 0
    while self.borrowed_books.length > counter
      puts pastel.decorate("Book #{counter + 1}\n", :red, :bold) +
      pastel.cyan("Title: ") + "#{self.borrowed_books[counter].name}\n" +
      pastel.cyan("Author: ") + "#{self.borrowed_books[counter].author}\n" +
      pastel.cyan("Synopsis: ") + "#{self.borrowed_books[counter].synopsis}\n" +
      pastel.cyan("Genre: ") + "#{self.borrowed_books[counter].genre}\n" +
      pastel.cyan("ISBN Number: ") + "#{self.borrowed_books[counter].isbn_13}\n" +
      pastel.cyan("Read Status: ") + "#{self.borrowed_book_reviews[counter].read_status}\n" +
      pastel.cyan("Current Page Number: ") + "#{self.borrowed_book_reviews[counter].page_number}\n" +
      pastel.cyan("My Rating: #{Cli.stars(self.borrowed_book_reviews[counter].rating)}\n") +
      pastel.cyan("My Review: ") + "#{self.borrowed_book_reviews[counter].review}\n" +
      pastel.cyan("Current Location: ") + "#{self.borrowed_book_reviews[counter].possession}\n" +
      pastel.cyan("Book Owner: ") + "#{borrowed_book_reviews[counter].user.first_name}\n"
      counter += 1
      Cli.line
      sleep 0.2
    end
    sleep 0.5
    Cli.borrowed_books_names_inner_menu
  end

  def books
    # Returns BOOK object of all books said user OWNS
    Book.all.select{|book| book.user_id == self.id}
  end

  def reviews
    # Returns USER_BOOK object of all books said user OWNS
    User_Book.all.select{|userbook| userbook.user_id == self.id}
  end

  def reviewed_books
    # Returns the BOOK object of all books said user has REVIEWED
    self.reviews.map{|reviews| reviews.book}
  end

  def borrowed_books
    # Returns BOOK object of all books said user has BORROWED
    self.reviewed_books-self.books
  end

  def borrowed_book_reviews
    # Returns USER_BOOK object of all books said user has BORROWED
    User_Book.all.select{|userbook| userbook.user_id == self.id && userbook.book.user_id != self.id}
  end

  def borrowed_books_names
    # Returns NAMES only of all BORROWED books said user has
    self.borrowed_books.map{|books| books.name}.join(", ")
  end

  def add_a_new_book_manually
    # Called from ADD_NEW_BOOK_MENU
    prompt = TTY::Prompt.new
    Cli.quotation
    Cli.line
    sleep 0.5

    answers = prompt.collect do
      key(:book_name).ask('Title: ')
      key(:book_author).ask('Author: ')
      key(:book_synopsis).ask('Synopsis: ')
      key(:genre).ask('Genre: ')
      key(:book_isbn).ask('ISBN Number: ')
      key(:read_status).select('Read Status: ', %w(Unopened Completed Reading Abandoned))
      key(:page_num).ask('Current Page Number: ')
      key(:rating).slider('Rating: ', max: 5, step: 1, default: 3)
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
    Cli.line
    sleep 0.5
    puts "Title: #{answers[:book_name]}
    Author: #{answers[:book_author]}
    Synopsis: #{answers[:book_synopsis]}
    Genre: #{answers[:genre]}
    ISBN Number: #{answers[:book_isbn]}
    Read Status: #{answers[:read_status]}
    Current Page Number: #{answers[:page_num]}
    My Rating: #{Cli.stars(answers[:rating])}
    My Review: #{answers[:review]}
    Current Location: #{answers[:possession]}\n"

    selection = prompt.select("Where to next?") do |a|
      a.choice '🏠  Main Menu'
      a.choice ''
      a.choice '❌  Exit'
    end

    case selection
    when '🏠  Main Menu'
      Cli.main_menu
    when ''
    when '❌  Exit'
      Cli.exit
    end
  end

  def select_book_to_edit
    # Called from MAIN_MENU
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
      My Rating: #{Cli.stars(self.reviews[counter].rating)}
      My Review: #{self.reviews[counter].review}
      Current Location: #{self.reviews[counter].possession}\n"
      counter += 1
    end
    answer = prompt.ask('Which book number would you like to edit?', convert: :int)
    if answer == "exit"
      exit
    else
      puts "You want to edit book number #{answer}"
      book = self.books[answer-1]
      review = self.reviews[answer-1]
      update_book(book, review, answer)
    end
  end

  def update_book(book, review, answer)
    # Called from SELECT_BOOK_TO_EDIT
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
        a8 = prompt.slider('Update your rating for this book: ', max: 5, step: 1, default: 3)
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
    # Called from UPDATE_BOOK
    prompt = TTY::Prompt.new
    puts "📚  Your book has been updated!
    Title: #{self.books[locator].name}
    Author: #{self.books[locator].author}
    Synopsis: #{self.books[locator].synopsis}
    Genre: #{self.books[locator].genre}
    ISBN Number: #{self.books[locator].isbn_13}
    Read Status: #{self.reviews[locator].read_status}
    Current Page Number: #{self.reviews[locator].page_number}
    My Rating: #{Cli.stars(self.reviews[locator].rating)}
    My Review: #{self.reviews[locator].review}
    Current Location: #{self.reviews[locator].possession}\n"
    sleep 0.5
    Cli.main_menu
  end
  #############################
  def update_personal_details
    # Called from ACCOUNT_PAGE
    prompt = TTY::Prompt.new
    Cli.clear
    Cli.bookcase
    Cli.quotation
    Cli.line
    puts "Lets change things up!"
    Cli.line
    selection = prompt.multi_select("Select the fields you would like to update: ") do |a|
      a.choice 'First Name'
      a.choice 'Last Name'
      a.choice 'E-Mail'
      a.choice 'Age'
    end
    if selection.length == 0
      Cli.line
      huh = prompt.yes?('No Options Selected, would you like to try again?') do |q|
        q.suffix 'Yes/No'
      end
      if huh == true
        update_personal_details
      else Cli.personal_details_inner_menu
      end
    else
    selection.each do |choice|
      case choice
      when 'First Name'
        c1 = prompt.ask('Enter your new first name: ')
        self.first_name = c1
      when 'Last Name'
        c2 = prompt.ask('Enter your new last name: ')
        self.last_name = c2
      when 'E-Mail'
        c3 = prompt.ask('Enter your new e-mail address: '){|q| q.validate :email}
        self.email = c3
      when 'Age'
        c4 = prompt.ask('Enter your new age: ')
        self.age = c4
      end
      self.save
    end
      Cli.line
      puts "Great, Thats been updated!"
      Cli.line
    sleep 0.5
    puts "Your new details are: \n
    Name: #{self.first_name} #{self.last_name}
    E-Mail: #{self.email}
    Age: #{self.age}\n"
    correct = prompt.yes?('Are these details now correct?') do |q|
      q.suffix 'Yes/No'
    end
    if correct == true
      Cli.personal_details_inner_menu
    else update_personal_details
    end
  end
  end
  ##############################
  def change_password
    # Called from ACCOUNT_PAGE and PERSONAL_DETAILS_INNER_MENU method
    prompt = TTY::Prompt.new
    old_password = prompt.mask('🔐   Please enter your OLD password: ')
    if old_password == self.password
      new_password = prompt.mask('🔐   Please enter your NEW password: ')
      self.update(password: new_password)
      Cli.line
      puts "Great! That has been updated! 💾 "
      sleep 2
      Cli.main_menu
    else
      choice = prompt.select("Sorry, That password does not match our records. Would you like to try again?") do |a|
        a.choice 'Try Again'
        a.choice 'Back to the Account Menu'
      end
      if choice == 'Try Again'
        change_password
      elsif choice == 'Back to the Account Menu'
        Cli.account_page
      end
    end
  end
  ##############################
  # Methods Below are NOT USED #
  ##############################
  def self.users
    # NOT USED
    self.all.map{|users| users.user_name}
  end

  def books_by_title_only
    # NOT USED
    self.books.map{|books| books.name}
  end

  def sort_by_rating
    # NOT USED
    User_Book.rating_desc.select{|userbook| userbook.user == self}
  end

  def completed?
    # NOT USED
    User_Book.completed?.select{|userbook| userbook.user_id == self.id}
  end

  def not_started
    # NOT USED
    User_Book.not_started.select{|userbook| userbook.user_id == self.id}
  end

  def abandoned
    # NOT USED
    User_Book.abandoned.select{|userbook| userbook.user_id == self.id}
  end

  def reading
    # NOT USED
    User_Book.reading.select{|userbook| userbook.user_id == self.id}
  end

  def must_return
    # NOT USED
    ### Add an if statment to say none if none.
    self.borrowed_book_reviews-User_Book.possession_others
  end

  def self.update_id
    # # NOT USED
    all_users = self.all.each do |users|
      users.id +=10
      users.save
    end
  end


  ####Ross's Methods Below!
  #Takes in an instance of a book, checks if the user created that book
  #(i.e owns the book) and destorys it AND it's User_Book entry
  def delete_book(book_instance, review_instance)

    if self.books.include?(book_instance)
      book_loop = TTY::Prompt.new
      bool = book_loop.yes?('Are you *sure* you want to delete?')
      if bool
        book_id = book_instance.id
        book_instance.destroy
        puts "#{book_instance.name} deleted from your Library!"
        user_book =  review_instance
        user_book.destroy
      else
        puts "Delete Cancelled!"
      end
    else
      puts "You do not own this book!"
    end
  end

  def select_book_to_delete
    prompt = TTY::Prompt.new
    counter = 0
    while self.books.length > counter
      #binding.pry   #BELOW breaks as review == nil
      puts "Book #{counter + 1}
      # Title: #{self.books[counter].name}
      # Author: #{self.books[counter].author}
      # Synopsis: #{self.books[counter].synopsis}
      # Genre: #{self.books[counter].genre}
      # ISBN Number: #{self.books[counter].isbn_13}
      # Read Status: #{self.reviews[counter].read_status}
      # Current Page Number: #{self.reviews[counter].page_number}
      # My Rating: #{stars(self.reviews[counter].rating)}
      # My Review: #{self.reviews[counter].review}
      # Current Location: #{self.reviews[counter].possession}\n"
      counter += 1
    end
    answer = prompt.ask('Which book number would you like to delete?', convert: :int)
    book = self.books[answer-1]
    review = self.reviews[answer-1]
    delete_book(book, review)
  end
end
