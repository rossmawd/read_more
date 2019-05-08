require_relative '../config/environment'
require_relative './command_line_interface'
require_relative './quotes'

prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)
pastel = Pastel.new

welcome
bookcase

puts "Hello and welcome to your bookcase!"
line
sleep 1
puts "\"#{$quotes.sample}\""
sleep 0.5
line
puts "Lets get started: "
line
start_menu
