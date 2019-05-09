require_relative '../config/environment'
require_relative './command_line_interface'

prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)
pastel = Pastel.new

Cli.welcome
Cli.bookcase

puts "Hello and welcome to your bookcase!"
Cli.line
sleep 1
Cli.quotation
sleep 0.5
Cli.line
puts "Lets get started: "
Cli.start_menu
