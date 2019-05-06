require_relative '../config/environment'

prompt = TTY::Prompt.new

puts "Hello and welcome to the book keeper!"

prompt.ask("Please enter your username to login or create a new account")

username = gets.chomp



User.check_user(username)

working_user = nil

def self.check_user(username)
# Will check if username already exsists and ask for password or will create a new user.
if User.find_by(user_name: username)
  user = User.find_by(user_name: username)
  puts "Hello #{user.first_name} #{user.last_name}."
  user.enter_password(user)
else
  puts "Hello #{username}, lets get started creating you a new profile."
  self.create_new_account(username)
end
end

def enter_password(user)
# Gets password from user
prompt.mask("Please enter your password: ")
password = gets.chomp
if self.password == password
  working_user = self
  puts "Welcome back!"
else puts "Sorry that password does not match our records, please enter your username to try again: "
  self.check_user(username)
end
end

def self.create_new_account(username)
  # Will create a new user and save to the database
  if User.users.includes?(username)
    puts "Unfortunatly that username is taken, please enter a different one."
    username = gets.chomp
    self.create_new_account(username)
  else
    user = User.create(user_name: username)
    puts "#{username} is free!"
    self.create_and_check_password(username)
  end
end

def self.create_and_check_password(username)
# Takes the string argument and saves as the password
prompt.mask("Now please choose a password.")
password = gets.chomp
if password.length >= 5
  self.password = password
  self.save
else puts "Your password must be at least 5 characters long."
  self.create_and_check_password(username)
end
end
