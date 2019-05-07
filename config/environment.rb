require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite'
)

# ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger = nil

require_all 'app'

###################
###################
###################

prompt = TTY::Prompt.new

###################

def start_menu
   prompt = TTY::Prompt.new
   selection = prompt.select("") do |a|
      a.choice '📚  Create New Account'
      a.choice '📚  Login'
      a.choice ' '
      a.choice '❌  Exit'
    end

    case selection
    when '📚  Create New Account'
        create_account
      when '📚  Login'
        login_account
      when '❌  Exit'
        exit
    end
end

###################

def create_account
  prompt = TTY::Prompt.new
   puts "✏️   Please enter a username: "

   username = gets.chomp

   if username == "exit"
      start_menu
    elsif !User.find_by(user_name: username)
      user = User.create(user_name: username)

      puts "Hi, #{username}, It's nice to meet you!"

      sleep 1

      password = prompt.mask('🔐   Please create a your password: ')
      user.update_password(password)

      puts "Password Set!"
      sleep 1

      puts "Now a few more steps to get you set up,"

      firstname = prompt.ask("✏️   Please enter your first name: ", required: true)

      lastname = prompt.ask("✏️   Please enter your last name: ", required: true)

      e_mail = prompt.ask('✏️   What is your email?'){|q| q.validate :email}

      age = prompt.ask("✏️   Please enter your age: ", required: true)

      user.update_user(firstname, lastname, e_mail, age)
### Confirm details with a recap and yes of no question
      user = User.last
   else
      puts "That name is taken. Please choose another one."
      create_account
   end
 end

 #################

 def login_account
   prompt = TTY::Prompt.new

   puts "✏️   Please enter a username: "
   username = gets.chomp

   if User.find_by(user_name: username)
     puts "Welcome Back #{username}!"

     User.find_by(user_name: username).check_password
   else
     choice = prompt.select("Sorry, I can't find that username. Would you like to try again?") do |a|
       a.choice 'Try Again'
       a.choice 'Back to Main Menu'
     end
     if choice == 'Try Again'
       login_account
     elsif choice == 'Back to Main Menu'
       start_menu
     end
   end
 end

#################

def main_menu(user)
  puts "Welcome Back inside your own personally library."

  prompt = TTY::Prompt.new
  selection = prompt.select("Where to next?") do |a|
     a.choice '📚  View Books'
     a.choice '📚  View Borrowed Books'
     a.choice '📚  Add a New Book'
     a.choice '📚  Add a New Review'
     a.choice ''
     a.choice '❌  Exit'
   end

   case selection
   when '📚  View Books'
       self.books
     when '📚  Borrowed Books'
       self.borrowed_books
     when '📚  Add a New Book'
       self.borrowed_books
     when '📚  Add a New Review'
       self.borrowed_books
     when '❌  Exit'
       exit
   end

end
