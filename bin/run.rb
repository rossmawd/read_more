require_relative '../config/environment'

prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)
pastel = Pastel.new

Cli.welcome
Cli.bookcase

Cli.line
sleep 0.5
Cli.quotation
sleep 0.5
Cli.line
Cli.start_menu
