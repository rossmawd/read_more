require_relative './config/environment'



binding.pry
puts "Mischief Managed!"

puts "Hello and welcome to the book keeper!"

puts "Please enter username"

username = gets.chomp

username.list_books
