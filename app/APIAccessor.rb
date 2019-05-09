class ApiAccessor < ActiveRecord::Base

    #HELPER:not every book has 'authors'
    def self.check_if_authors_key_exists(index, api_result)
      authors = api_result["items"][index]["volumeInfo"]["authors"]
      authors == nil ? output = "No Author found" : output = authors.join(", ")
      output
    end

    #HELPER
    def self.check_if_genre_key_exists(index, api_result)
      genres = api_result["items"][index]["volumeInfo"]["categories"]
      genres == nil ? output = "No Genre found" : output = genres.join(", ")
      output
    end
    
    #HELP
    def self.check_if_url_key_exists(index, api_result)
      url = api_result["items"][index]["volumeInfo"]["previewLink"]
      url == nil ? output = "No url found" : output = url
      output
    end

    #HELPER find's if the book has ISBN_13, else nil
    def self.find_isbn_13(index, api_result)
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

  # Displays the title, author, publishedDate for the top 3? results  
  def self.display_three_books(i = 0, api_result)
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
 
  #TTY inteface asking the user if they want to choose from 1st 3 books, or see 3 more
  def self.book_choice_menu(api_result)
    menu = TTY::Prompt.new
    bool = true
    i = 3  #PLAYING
    while bool
      selection = menu.select("What would you like to do?") do |a|
        a.choice '📚  See the next 3 books' #BROKEN
        a.choice '📚  Add one of these to your library'
        a.choice '📚  Search Again'
        a.choice ''
        a.choice '❌  Exit'
      end  
      case selection
        when '📚  See the next 3 books'

            puts "------------------------------------"
            more_than_nine = i >= 9 ? "Sorry, 9 results is the max! Please search again.\n\n" : "Here are the next three:\n-------------------------------"
            puts more_than_nine
            if i >= 9 then break end
            display_three_books(i, api_result)
            
            i += 3
          #end
        
        when '📚  Add one of these to your library'
          #blank as it moves to next method anyway
          break
        when '📚  Search Again'
          get_input_and_search_api
          break
        when '❌  Exit'
          Cli.main_menu
      end
    end
  end

  #The user then chooses the one they want to enter into their database:
  def self.book_choice
    puts "Please enter a book\'s number to add it into your library: (or type 'quit' to go back) "
    choice = gets.chomp
    #binding.pry
    if choice == "quit" 
      Cli.main_menu 
    elsif choice.to_i.class != Integer 
      puts "Only numbers please !"
      book_choice
    elsif choice.to_i > 9 || choice.to_i < 1
      puts "Choose book by typing number 1 to 9!"
      book_choice
    else 
      puts "Sweet!"   #Will break if they don't give a number (1,2,3 etc) 
      choice.to_i
    end
    #choice
  end

  #Adds book (if not already owned) and creates a User_book instance
  def self.add_new_book_from_api(book_choice, user_id, api_result)
    index = book_choice - 1
    
    if Book.all.find_by(isbn_13: find_isbn_13(index, api_result)) == nil
      book_isbn = find_isbn_13(index, api_result)
      Book.create(
        name: api_result["items"][index]["volumeInfo"]["title"], 
        synopsis: api_result["items"][index]["volumeInfo"]["description"],
        genre: check_if_genre_key_exists(index, api_result),
        user_id: user_id, 
        author: check_if_authors_key_exists(index, api_result), 
        isbn_13: find_isbn_13(index, api_result),
        url: check_if_url_key_exists(index, api_result)
        )
      
      User_Book.create(
        review: "",
        rating: 0,
        page_number: 0,
        read_status: "",
        book_id: Book.all.find_by(isbn_13: book_isbn),
        user_id: user_id,
        possession: "",
       )
        puts "'#{api_result["items"][index]["volumeInfo"]["title"]}' has been saved to your Library!" 
    else
      puts "You already own this book! Please select a new one!" 
    end
  end

  #This method collects the user's search input and calls ALL other methods needed to add book via API
  def self.get_input_and_search_api
    puts
    puts "-----------------------------------------------------"
    puts "Please enter a book title or author name (or both!) 📚"
    answer = gets.chomp

    puts 
    puts "Thanks! Searching for book... 🔍"
    puts             

    result = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{answer}")

    puts "Books found! 😀  Here are the top 3:"
    puts
    book_search_results = JSON.parse(result)

    display_three_books(i=0, book_search_results)
    book_choice_menu(book_search_results)
    add_new_book_from_api(book_choice,$current_user.id, book_search_results)

    search_again = TTY::Prompt.new
    bool = search_again.yes?('Would you like to search again?')
    if bool
      Cli.clear
      get_input_and_search_api
    else
      Cli.clear
      Cli.main_menu
    end
  end

end

 


  
 



#display_three_books(0, api_result) #iterates through above HASH's attributes and puts them out

#book_choice_menu(api_result, i=0) #asks the user if they want to see more books

#book_choice #Promts the user to make a numerical choice

#add_new_book_from_api(book_choice, 3, api_result)


