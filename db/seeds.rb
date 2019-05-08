Genre.create(name: "Horror")
Genre.create(name: "Fantasy")
Genre.create(name: "Romance")
Genre.create(name: "Science Fiction")
Genre.create(name: "Biography")

User.create(user_name: "marco4eva", password: "marcopassword", first_name: "Marco")
User.create(user_name: "ayleen4eva", password: "ayleenpassword", first_name: "Ayleen")
User.create(user_name: "ines4eva", password: "inespassword", first_name: "Ines")
User.create(user_name: "amari4eva", password: "amaripassword", first_name: "Amari")
User.create(user_name: "dan4eva", password: "danpassword", first_name: "Dan")

Book.create(name: "Harry Potter", synopsis: "about a wizard", author: "author 1", user_id: 4, genre_id: 3, isbn_13: 2809358195284)
Book.create(name: "Ice and Fire", synopsis: "Medieval Porn", author: "author 2", user_id: 3, genre_id: 4)
Book.create(name: "Sapiens", synopsis: "history of humans", author: "author 3", user_id: 1, genre_id: 2)
Book.create(name: "Human instinct", synopsis: "about human instinct", author: "author 4", user_id: 2, genre_id: 1)
Book.create(name: "The Wave", synopsis: "School experiment", author: "author 5", user_id: 4, genre_id: 1)

Book.create(name: "Lauren's Book", synopsis: "Lauren's Book Synopsis", author: "Lauren's Book Author", user_id: 6, genre_id: 1)

User_Book.create(user_id: 2, book_id: 1, read_status: "Abandoned", page_number: 233, rating: 1, review: "Really bad", possession: "On The Shelf")
User_Book.create(user_id: 3, book_id: 3, read_status: "Completed", page_number: 200, rating: 2, review: "It sucks", possession: "On The Shelf")
User_Book.create(user_id: 4, book_id: 4, read_status: "Not Started", page_number: nil, rating: nil, review: nil, possession: "On The Shelf")
User_Book.create(user_id: 1, book_id: 5, read_status: "Reading", page_number: 33, rating: 5, review: "Amazing", possession: "On The Shelf")
User_Book.create(user_id: 5, book_id: 2, read_status: "Reading", page_number: 55, rating: 4, review: "So far OK", possession: "On The Shelf")
User_Book.create(user_id: 3, book_id: 2, read_status: "Completed", page_number: 355, rating: 4, review: "Nice", possession: "Off The Shelf")

User_Book.create(user_id: 6, book_id: 6, read_status: "Abandoned", page_number: 732, rating: 1, review: "CRAP!!!", possession: "Off The Shelf")
User_Book.create(user_id: 6, book_id: 1, read_status: "Completed", page_number: 732, rating: 5, review: "AMAZING!!!", possession: "On The Shelf")
