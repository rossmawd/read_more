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
    Book.all.select{|book| book.user.id == self.id}
  end

  def books_names
    names = ""
    syns = ""
    array = []
    counter = 0
    while self.books.length > array.length
      title = Book.all[counter].name
      synops = Book.all[counter].synopsis
      rating = User_Book.all[counter].rating
      review = User_Book.all[counter].review
      ownership = User_Book.all[counter].possession
      puts "Book #{counter + 1}:\n
      Title: #{title}\n
      Synopsis: #{synops}\n
      Rating: #{rating}\n
      Review: #{review}\n
      Current Location: #{possession}"
    end
    counter += 1
  def books_by_name
    self.books.map{|books| books.name}
  end

  def view_books
    prompt = TTY::Prompt.new
    array = self.books
    choices = (array.to_s.gsub(/\"/, '\'').gsub(/[\[\]]/, ''))
    prompt.enum_select("Select a Book to Read More:", choices)
    # puts self.books
    # puts "Displaying all current users books!!"
  end

  # def books_names
  #
  #   title = ""
  #   synops = ""
  #   author = ""
  #   rating = ""
  #   review = ""
  #   ownership = ""
  #   read_stat = ""
  #   page = ""
  #
  #   counter = 0
  #
  #   while self.books.length < counter do
  #   Book.all.each do |book|
  #       title = book.name
  #       synops = book.synopsis
  #       author = book.author
  #     end
  #     User_Book.all.each do |userbook|
  #       rating = userbook.rating
  #       review = userbook.review
  #       ownership = userbook.possession
  #       read_stat = userbook.read_status
  #       page = userbook.page_number
  #     end
  #     puts "Book #{counter +1}:\n
  #     Title: #{title}\n
  #     Synopsis: #{synops}\n
  #     Rating: #{rating}\n
  #     Review: #{review}\n
  #     Status: #{read_stat} - Page Number: #{page}\n
  #     Current Location: #{ownership}"
  #     counter +=1
  #   end
  # end

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
    self.borrowed_books-User_Book.possession_mine
  end

  def self.update_id
    # Updates all books ID's
    all_users = self.all.each do |users|
      users.id +=10
      users.save
    end
  end

  ####Ross's Methods Below!

  

end
