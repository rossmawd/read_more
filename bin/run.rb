require_relative './config/environment'

puts "Hello and welcome to the book keeper!"

puts "Please enter your username to login or create a new account"

username = gets.chomp

username.check_user

def check_user
  # Will check if username already exsists and ask for password or will create a new user.
  if User.find_by(name: username)
    user = User.find_by(name: username)
    puts "Hello #{user.first_name} #{user.last_name}."
    self.enter_password
  else
    puts "Hello #{username}, lets get started creating you a new profile."
    self.create_new_account
  end
end

def create_new_account
  # Will create a new user and save to the database
  if !User.find_by(name: username)
    puts "Sorry, that username is taken, please enter a different one."
    self.create_new_account
  else
    user = User.create(name: username)
    puts "Now please choose a password."
    password = gets.chomp
    self.create_password(password)
  end
end

def create_and_check_password(password_string)
  # Takes the string argument and saves as the password
  if password_string.length >= 5
    self.password = password_string
    self.save
  else puts "Your password must be at least 5 characters long."
    self.create_new_account
  end
end
