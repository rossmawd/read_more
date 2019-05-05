require_relative './config/environment'

puts "Hello and welcome to the book keeper!"

puts "Please enter your username to login or create a new account"

username = gets.chomp

username.check_user
