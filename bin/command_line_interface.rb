

require 'pry'
###################

def welcome
  font = TTY::Font.new(:standard)
  pastel = Pastel.new
  puts pastel.cyan(font.write("Read More"))
end


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

      main_menu
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

     user = User.find_by(user_name: username)
     user.check_password
   else
     choice = prompt.select("Sorry, I can't find that username. Would you like to try again?") do |a|
       a.choice 'Try Again'
       a.choice 'Back to Start Menu'
     end
     if choice == 'Try Again'
       login_account
     elsif choice == 'Back to Start Menu'
       start_menu
     end
   end
 end

#################

def main_menu
  puts "Welcome Back inside your own personally library."

  prompt = TTY::Prompt.new
  selection = prompt.select("Where to next?") do |a|
     a.choice '📚  View Books'
     a.choice '📚  View Borrowed Books'
     a.choice '📚  Add a New Book'
     a.choice '📚  Review a Book'
     a.choice ''
     a.choice '❌  Exit'
   end

   case selection
   when '📚  View Books'
       my_books_list
     when '📚  View Borrowed Books'
       my_borrowed_books_list
     when '📚  Add a New Book'
       add_a_new_book_manually
     when '📚  Review a Book'
       puts "This is where you will be able to review a new book"
       main_menu
     when '❌  Exit'
       exit
   end
end

#######################

def books_names_inner_menu
  prompt = TTY::Prompt.new

  selection = prompt.select("Where to next?") do |a|
     a.choice '📚  Select Book to See More'
     a.choice '📚  Edit a Book'
     a.choice '📚  Review a Book'
     a.choice '📚  Main Menu'
     a.choice ''
     a.choice '❌  Exit'
   end

   case selection
   when '📚  Select Book to See More'
       puts "See more about selected book, write a method to select book by number and shoe said book"
       main_menu
     when '📚  Edit a Book'
       puts "Write a method to ask for book number and edit said book"
       main_menu
     when '📚  Review a Book'
       puts "Write a method to ask for book number and review said book"
       main_menu
     when '📚  Main Menu'
       main_menu
     when '❌  Exit'
       exit
   end
 end

############################

def internal_menu
    prompt = TTY::Prompt.new
    selection = prompt.select("Where to next?") do |a|
       a.choice '📚  Sort by Title'
       a.choice '📚  Sort by Author'
       a.choice '📚  Main Menu'
       a.choice ''
       a.choice '❌  Exit'
     end

     case selection
     when '📚  Sort by Title'
         puts "Sorting by Title"
       when '📚  Sort by Author'
         puts "Sorting by Author"
       when '📚  Main Menu'
         self.main_menu
       when '❌  Exit'
         exit
     end
end
