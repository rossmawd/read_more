class User < ActiveRecord::Base
  has_many :books
  has_many :user_books
  has_many :genres, through: :books
  has_many :authors, through: :books
  has_many :books, through: :user_books

  # working_user = nil
  #
  # def self.check_user(username)
  #   # Will check if username already exsists and ask for password or will create a new user.
  #   if User.find_by(user_name: username)
  #     user = User.find_by(user_name: username)
  #     puts "Hello #{user.first_name} #{user.last_name}."
  #     user.enter_password
  #   else
  #     puts "Hello #{username}, lets get started creating you a new profile."
  #     self.create_new_account(username)
  #   end
  # end
  #
  # def enter_password
  #   # Gets password from user
  #   puts "Please enter your password: "
  #   password = gets.chomp
  #   if self.password == password
  #     working_user = self
  #     puts "Welcome back!"
  #   else puts "Sorry that password does not match our records, please enter your username to try again: "
  #     self.check_user(username)
  #   end
  # end
  #
  # def self.create_new_account(username)
  #   # Will create a new user and save to the database
  #   if User.users.include?(username)
  #     puts "Unfortunatly that username is taken, please enter a different one."
  #     username = gets.chomp
  #     self.create_new_account(username)
  #   else
  #     user = User.create(user_name: username)
  #     puts "#{username} is free!"
  #     self.create_and_check_password(username)
  #   end
  # end
  #
  # def self.create_and_check_password(username)
  #   # Takes the string argument and saves as the password
  #   user = User.find_by(user_name: username)
  #   puts "Now please choose a password."
  #   password = gets.chomp
  #   if password.length >= 5
  #     user.password = password
  #     user.save
  #   else puts "Your password must be at least 5 characters long."
  #     self.create_and_check_password(username)
  #   end
  # end

  def self.users
    # List all users.
    self.all.map{|users| users.user_name}
  end

  def books
    # Returns book object of all books said user has created
    Book.all.select{|book| book.user.id == self.id}
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

  def borrowed_books_names
    self.borrowed_books.map{|books| books.name}.join
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
end
