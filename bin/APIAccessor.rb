require 'pry'
require 'rest-client'
require 'json'
require_relative '../config/environment'   #Ross added this

#BELOW: the CLI for Entering A book using the API

puts "Welcome to Google Books API"
puts "Please enter a book title"
answer = gets.chomp

puts " "
puts "Thanks! Searching for book..."
puts " "               #is there a better way for entering blank lines??

result = RestClient.get("https://www.googleapis.com/books/v1/volumes?q=#{answer}")

book_search_results = JSON.parse(result)

puts "Books found!"

 
 # Displays the title, author, publishedDate for the top 3? results
 i = 0
 3.times do
    puts "Book #{i+1}"
    puts "Title: #{book_search_results["items"][i]["volumeInfo"]["title"]}\n"
    #BELOW 3 lines to adjust for the key 'authors' not always existing
    authors = book_search_results["items"][i]["volumeInfo"]["authors"]
    authors == nil ? output = nil : output = authors.join(", ")
    puts "Author: #{output}"
    puts "Date Published: #{book_search_results["items"][i]["volumeInfo"]["publishedDate"]}"
    puts
    i += 1
 end


 #The user then chooses the one they want to enter into their database:

  puts "Please choose the book you would like to enter into you library by entering it's number (e.g. 1,2 or 3): "
  choice = gets.chomp
  choice = choice.to_i   #Will break if they don't give a number (1,2,3 etc) 

  #HELPER:not every book has 'authors'
  def check_if_authors_key_exists(index, book_search_results)
    authors = book_search_results["items"][index]["volumeInfo"]["authors"]
    authors == nil ? output = nil : output = authors.join(", ")
    output
  end

  #HELPER find's if the book has ISBN_13, else nil
  def find_isbn_13(index, book_search_results)
    length = book_search_results["items"][index]["volumeInfo"]["industryIdentifiers"].length
    i = 0
    isbn = 0
    length.times {
      isbn_hash = book_search_results["items"][index]["volumeInfo"]["industryIdentifiers"][i]
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

  def add_new_book_from_api(choice, user_id, book_search_results)
    index = choice - 1

    #Below searhes ALL books, need to specify only the user's books (Once I move this into the User class):
  if Book.all.find_by(isbn_13: book_search_results["items"][index]["volumeInfo"]["industryIdentifiers"][0]["identifier"]) == nil
      Book.create(
        name: book_search_results["items"][index]["volumeInfo"]["title"], 
        synopsis: book_search_results["items"][index]["volumeInfo"]["description"], 
        user_id: user_id, 
        author: check_if_authors_key_exists(index, book_search_results), 
        isbn_13: find_isbn_13(index, book_search_results)
        )
    else
      puts "You already own this book! Please select a new one!" #NEED TO LOOP!
    end
  end

add_new_book_from_api(choice, 3, book_search_results)

