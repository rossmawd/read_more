require 'pry'
require 'rest-client'
require 'json'
require_relative '../config/environment'   #Ross added this

  #HELPER:not every book has 'authors'
  def check_if_authors_key_exists(index, api_result)
    authors = api_result["items"][index]["volumeInfo"]["authors"]
    authors == nil ? output = "No Author found" : output = authors.join(", ")
    output
  end

  #HELPER
  def check_if_genre_key_exists(index, api_result)
    genres = api_result["items"][index]["volumeInfo"]["categories"]
    genres == nil ? output = "No Genre found" : output = genres.join(", ")
    output
  end

  #HELPER find's if the book has ISBN_13, else nil
  def find_isbn_13(index, api_result)
    length = api_result["items"][index]["volumeInfo"]["industryIdentifiers"].length
    i = 0
    isbn = 0
    length.times {
      isbn_hash = api_result["items"][index]["volumeInfo"]["industryIdentifiers"][i]
      if isbn_hash.value?("ISBN_13")
        isbn = isbn_hash["identifier"]
        break
      else
        isbn = nil
      end
      i +=1
      isbn
    }  
    isbn
  end

#####BELOW: the CLI for Entering A book using the API

 # Displays the title, author, publishedDate for the top 3? results  
 def display_three_books(i = 0, api_result)
  3.times do
      puts "Book #{i+1}"
      puts "Title: #{api_result["items"][i]["volumeInfo"]["title"]}\n"
      #BELOW 3 lines to adjust for the key 'authors' not always existing
      authors = api_result["items"][i]["volumeInfo"]["authors"]
      authors == nil ? output = nil : output = authors.join(", ")
      puts "Author: #{output}"
      puts "Date Published: #{api_result["items"][i]["volumeInfo"]["publishedDate"]}"
      puts "Publisher: #{api_result["items"][i]["volumeInfo"]["publisher"]}"
      puts
      i += 1
  end
end

def book_choice_menu(api_result)
  menu = TTY::Prompt.new
 
  selection = menu.select("What would you like to do?") do |a|
    a.choice '📚  See the next 3 books'
    a.choice '📚  Select one of these'
    a.choice ''
    a.choice '❌  Exit'
  end
  i = 3
  case selection
    when '📚  See the next 3 books'
      bool = true
      while bool
        more_than_nine = i >= 9 ? "Sorry, 9 results is the max! Please search again.\n\n" : "Here are the next three:\n-------------------------------"
        puts more_than_nine
        if i >= 9 then break end

        display_three_books(i, api_result)
        
        book_loop = TTY::Prompt.new
        bool = book_loop.yes?('Would you like to see more?')
        i += 3
      end
    
    when '📚  Select one of these'
      #my_borrowed_books_list
    when '❌  Exit'
      exit
  end
end

#The user then chooses the one they want to enter into their database:
def book_choice
  puts "Please enter a book\'s number to enter it into your library: "
  choice = gets.chomp
  choice = choice.to_i   #Will break if they don't give a number (1,2,3 etc) 
end

#Need to connect to a user (Once I move this into the User class):
def add_new_book_from_api(book_choice, user_id, api_result)
  index = book_choice - 1

  if Book.all.find_by(isbn_13: api_result["items"][index]["volumeInfo"]["industryIdentifiers"][0]["identifier"]) == nil
    Book.create(
      name: api_result["items"][index]["volumeInfo"]["title"], 
      synopsis: api_result["items"][index]["volumeInfo"]["description"],
      genre: check_if_genre_key_exists(index, api_result),
      user_id: user_id, 
      author: check_if_authors_key_exists(index, api_result), 
      isbn_13: find_isbn_13(index, api_result)
      )
    
    User_Book.create(
      review: ""
      rating: 
      page_number:
      read_status:
      book_id: #How do I get this?
      user_id: user_id
      possession: 
      
    )
      puts "'#{api_result["items"][index]["volumeInfo"]["title"]}' has been saved to your Library!" 
  else
    puts "You already own this book! Please select a new one!" #NEED TO LOOP!
  end
end

#This method collects the user's search input and calls all other methods needed to add book via API
def get_input_and_search_api
  puts "Welcome to Google Books API "
  puts "Please enter a book title or author name (or both!) 📚"
  answer = gets.chomp

  puts 
  puts "Thanks! Searching for book... 🔍"
  puts               #is there a better way for entering blank lines??

  result = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{answer}")

  puts "Books found! 😀  Here are the top 3:"
  book_search_results = JSON.parse(result)

  display_three_books(i=0, book_search_results)
  book_choice_menu(book_search_results)
  add_new_book_from_api(book_choice,3, book_search_results)
  Cli.add_new_book_menu

end

get_input_and_search_api



 


  
 



#display_three_books(0, api_result) #iterates through above HASH's attributes and puts them out

#book_choice_menu(api_result, i=0) #asks the user if they want to see more books

#book_choice #Promts the user to make a numerical choice

#add_new_book_from_api(book_choice, 3, api_result)


