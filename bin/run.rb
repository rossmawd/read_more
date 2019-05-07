require_relative '../config/environment'
require_relative './command_line_interface'

prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)
pastel = Pastel.new

welcome

puts "Hello and welcome to the book keeper!"

sleep 1

puts "Lets get started: "

start_menu
