require_relative '../config/environment'
require_relative './command_line_interface'
#require_relative './APIAccessor'             #REMOVE!!

prompt = TTY::Prompt.new

puts "Hello and welcome to the book keeper!"

sleep 1

puts "Lets get started: "

start_menu
