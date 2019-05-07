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
    puts "Author(s): #{book_search_results["items"][i]["volumeInfo"]["authors"].join(", ")}"
    puts "Date Published: #{book_search_results["items"][i]["volumeInfo"]["publishedDate"]}"
    puts
    i += 1
 end


 #The user then chooses the one they want to enter into their database:

  puts "Please choose the book you would like to enter into you library by entering it's number (e.g. 1,2 or 3): "
  choice = gets.chomp
  choice = choice.to_i   #Will break if they don't give a number (1,2,3 etc) 

def add_new_book_from_api(choice, user_id, book_search_results)
  index = choice - 1
  #Below searhes ALL books, need to specify only the user's books (Once I move this into the User class):
 if Book.all.find_by(isbn_13: book_search_results["items"][index]["volumeInfo"]["industryIdentifiers"][0]["identifier"]) == nil
    Book.create(
      name: book_search_results["items"][index]["volumeInfo"]["title"], 
      synopsis: book_search_results["items"][index]["volumeInfo"]["description"], 
      user_id: user_id, 
      author: book_search_results["items"][index]["volumeInfo"]["authors"].join(', '),
      isbn_13: book_search_results["items"][index]["volumeInfo"]["industryIdentifiers"][0]["identifier"] #the API is inconsistant here! 
      #sometimes this array position is ISBN10, sometimes ISBN13
      )
  else
    puts "You already own this book! Please select a new one!" #NEED TO LOOP!
  end
end

add_new_book_from_api(choice, 3, book_search_results)



 #  book["volumeInfo"].each do |volInfo|

 #   binding.pry
      #title = RestClient.get(volInfo)
      #title_hash = JSON.parse(title)
      #binding.pry
      #puts title_hash["title"]
  #end


#  book["films"].each do |film_url|
#     film_res = RestClient.get(film_url)
#     film_hash = JSON.parse(film_res)
#     puts film_hash["title"]
# end
