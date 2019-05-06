require_relative '../config/environment'

prompt = TTY::Prompt.new

puts "Hello and welcome to the book keeper!"

prompt.ask("Please enter your username to login or create a new account")

username = gets.chomp

User.check_user(username)
