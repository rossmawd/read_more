User.create(user_name: "marco4eva", password: "marcopassword", first_name: "Marco")
User.create(user_name: "ayleen4eva", password: "ayleenpassword", first_name: "Ayleen")
User.create(user_name: "ines4eva", password: "inespassword", first_name: "Ines")
User.create(user_name: "amari4eva", password: "amaripassword", first_name: "Amari")
User.create(user_name: "dan4eva", password: "danpassword", first_name: "Dan")

Book.create(name: "Harry Potter", synopsis: "about a wizard", author: "author 1", user_id: 4, genre: "Fantasy", isbn_13: 2802958195284)
Book.create(name: "Ice and Fire", synopsis: "Medieval Porn", author: "author 2", user_id: 3, genre: "Fantasy", isbn_13: 2819365195284)
Book.create(name: "Sapiens", synopsis: "history of humans", author: "author 3", user_id: 1, genre: "Popular Science", isbn_13: 2809109635284)
Book.create(name: "Human instinct", synopsis: "about human instinct", author: "author 4", user_id: 2, genre: "Popular Science", isbn_13: 2547928195284)
Book.create(name: "The Wave", synopsis: "School experiment", author: "author 5", user_id: 4, genre: "Drama", isbn_13: 2809358195724)

User_Book.create(user_id: 2, book_id: 1, read_status: "Abandoned", page_number: 233, rating: 1, review: "Really bad", possession: "On The Shelf")
User_Book.create(user_id: 3, book_id: 3, read_status: "Completed", page_number: 200, rating: 2, review: "It sucks", possession: "On The Shelf")
User_Book.create(user_id: 4, book_id: 4, read_status: "Not Started", page_number: nil, rating: nil, review: nil, possession: "On The Shelf")
User_Book.create(user_id: 1, book_id: 5, read_status: "Reading", page_number: 33, rating: 5, review: "Amazing", possession: "On The Shelf")
User_Book.create(user_id: 5, book_id: 2, read_status: "Reading", page_number: 55, rating: 4, review: "So far OK", possession: "On The Shelf")
User_Book.create(user_id: 3, book_id: 2, read_status: "Completed", page_number: 355, rating: 4, review: "Nice", possession: "Off The Shelf")




Book.create(name: "1 - Laurens Book", synopsis: "1 - Laurens Synopsis", author: "1 - Laurens Author", user_id: 6, genre: "Drama", isbn_13: 2809358195724)
User_Book.create(user_id: 6, read_status: "Completed", page_number: 732, rating: 5, review: "AMAZING!!!", possession: "On The Shelf", book_id: 6,)

