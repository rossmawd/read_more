require_relative '../config/environment'
#require_relative '../command_line_interface'

prompt = TTY::Prompt.new
font = TTY::Font.new(:standard)
pastel = Pastel.new

# Cli.welcome
# Cli.bookcase
#
# Cli.line
# sleep 0.5
# Cli.quotation
# sleep 0.5
# Cli.line
# Cli.start_menu

Cli.easter_egg
