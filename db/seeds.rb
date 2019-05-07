Genre.create(name: "Horror")
Genre.create(name: "Fantasy")
Genre.create(name: "Romance")
Genre.create(name: "Science Fiction")
Genre.create(name: "Biography")

Author.create(first_name: "Ross", last_name: "Mawdsley")
Author.create(first_name: "Lauren", last_name: "Carne" )
Author.create(first_name: "Nico", last_name: "Marcora")
Author.create(first_name: "Sam", last_name: "Barker")
Author.create(first_name: "Ian", last_name: "Harrison")

User.create(user_name: "Marco")
User.create(user_name: "Ayleen")
User.create(user_name: "Ines")
User.create(user_name: "Amari")
User.create(user_name: "Dan")

Book.create(name: "Harry Potter", synopsis: "about a wizard", user_id: 4, author_id: 4, genre_id: 3)
Book.create(name: "Ice and Fire", synopsis: "Medieval Porn", user_id: 3, author_id: 2, genre_id: 4)
Book.create(name: "Sapiens", synopsis: "history of humans", user_id: 1, author_id: 3, genre_id: 2)
Book.create(name: "Human instinct", synopsis: "about human instinct", user_id: 2, author_id: 5, genre_id: 1)
Book.create(name: "The Wave", synopsis: "School experiment", user_id: 4, author_id: 1, genre_id: 1)

User_Book.create(user_id: 2, book_id: 1, read_status: "Abandoned", page_number: 233, rating: 1, review: "Really bad")
User_Book.create(user_id: 3, book_id: 3, read_status: "Completed", page_number: 200, rating: 2, review: "It sucks")
User_Book.create(user_id: 4, book_id: 4, read_status: "Not Started", page_number: nil, rating: nil, review: nil)
User_Book.create(user_id: 1, book_id: 5, read_status: "Reading", page_number: 33, rating: 5, review: "Amazing")
User_Book.create(user_id: 5, book_id: 2, read_status: "Reading", page_number: 55, rating: 4, review: "So far OK")
User_Book.create(user_id: 3, book_id: 2, read_status: "Completed", page_number: 355, rating: 4, review: "Nice")
