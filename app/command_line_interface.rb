class Cli < ActiveRecord::Base

  require 'pry'
  ###################
  def self.bookcase
    pastel = Pastel.new
    puts pastel.cyan"
    .--.           .---.        .-.
    .---|--|   .-.     | A |  .---. |~|    .--.
    .--|===|Ch|---|_|--.__| S |--|:::| |~|-==-|==|---.
    |%%|NT2|oc|===| |~~|%%| C |--|   |_|~|CATS|  |___|-.
    |  |   |ah|===| |==|  | I |  |:::|=| |    |GB|---|=|
    |  |   |ol|   |_|__|  | I |__|   | | |    |  |___| |
    |~~|===|--|===|~|~~|%%|~~~|--|:::|=|~|----|==|---|=|
    ^--^---'--^---^-^--^--^---'--^---^-^-^-==-^--^---^-'
    "
  end
  ###################
  def self.clear
    system('clear')
  end
  ###################
  def self.line
    puts ""
  end
  ###################
  def self.quotation
    pastel = Pastel.new
    quotes = ["A reader lives a thousand lives before he dies . . . The man who never reads lives only one. – George R.R. Martin", "Until I feared I would lose it, I never loved to read. One does not love breathing. – Harper Lee", "Never trust anyone who has not brought a book with them. – Lemony Snicket", "You can never get a cup of tea large enough or a book long enough to suit me. – C.S. Lewis", "Reading is essential for those who seek to rise above the ordinary. – Jim Rohn", "The more that you read, the more things you will know. The more that you learn, the more places you’ll go. – Dr. Seuss", "I find television very educating. Every time somebody turns on the set, I go into the other room and read a book. – Groucho Marx", "Classic – a book which people praise and don’t read. – Mark Twain", "You don’t have to burn books to destroy a culture. Just get people to stop reading them. – Ray Bradbury", "So please, oh please, we beg, we pray, go throw your TV set away, and in its place you can install a lovely bookshelf on the wall. – Roald Dahl", "If you don’t like to read, you haven’t found the right book. – J.K. Rowling", "Think before you speak. Read before you think. – Fran Lebowitz", "Let’s be reasonable and add an eighth day to the week that is devoted exclusively to reading. – Lena Dunham", "The reading of all good books is like conversation with the finest (people, of the past centuries. – Descartes", "In the case of good books, the point is not to see how many of them you can get through, but rather how many can get through to you. – Mortimer J. Adler", "Reading one book is like eating one potato chip. – Diane Duane", "Books are a uniquely portable magic. – Stephen King", "I read a book one day and my whole life was changed. – Orhan Pamuk", "People say that life is the thing, but I prefer reading. – Logan Pearsall Smith", "Today a reader, tomorrow a leader. – Margaret Fuller", "People can lose their lives in libraries. They ought to be warned. – Saul Bellow", "A good book is an event in my life. – Stendhal", "Reading brings us unknown friends – Honoré de Balzac", "The world was hers for the reading. – Betty Smith", "I kept always two books in my pocket, one to read, one to write in. – Robert Louis Stevenson", "The person who deserves most pity is a lonesome one on a rainy day who doesn’t know how to read. – Benjamin Franklin", "Once you have read a book you care about, some part of it is always with you. – Louis L’Amour", "Literature is the most agreeable way of ignoring life. – Fernando Pessoa", "No. I can survive well enough on my own—if given the proper reading material. – Sarah J. Maas", "There is more treasure in books than in all the pirate's loot on Treasure Island. – Walt Disney", "We are of opinion that instead of letting books grow moldy behind an iron grating, far from the vulgar gaze, it is better to let them wear out by being read. – Jules Verne", "My alma mater was books, a good library…. I could spend the rest of my life reading, just satisfying my curiosity. – Malcolm X", "It’s not that I don’t like people. It’s just that when I’m in the company of others – even my nearest and dearest – there always comes a moment when I’d rather be reading a book. – Maureen Corrigan", "Books to the ceiling, Books to the sky, My pile of books is a mile high. How I love them! How I need them! I’ll have a long beard by the time I read them. – Arnold Lobel", "There is nothing more luxurious than eating while you read—unless it be reading while you eat. – E. Nesbit", "One glance at a book and you hear the voice of another person, perhaps someone dead for 1,000 years. To read is to voyage through time. – Carl Sagan", "I have a passion for teaching kids to become readers, to become comfortable with a book, not daunted. Books shouldn’t be daunting, they should be funny, exciting and wonderful; and learning to be a reader gives a terrific advantage. – Roald Dahl", "Man reading should be man intensely alive. The book should be a ball of light in one’s hand. – Ezra Pound", "If we encounter a man of rare intellect, we should ask him what books he reads. – Ralph Waldo Emerson", "Always read something that will make you look good if you die in the middle of it. – P.J. O’Rourke", "Many people, myself among them, feel better at the mere sight of a book. – Jane Smiley", "Beware of the person of one book. – Thomas Aquinas", "Read the best books first, or you may not have a chance to read them at all. – Henry David Thoreau", "Make it a rule never to give a child a book you would not read yourself. – George Bernard Shaw", "Books serve to show a man that those original thoughts of his aren’t very new after all. – Abraham Lincoln", "I can’t imagine a man really enjoying a book and reading it only once. – C.S. Lewis", "You know you’ve read a good book when you turn the last page and feel a little as if you have lost a friend. – Paul Sweeney", "Some books leave us free and some books make us free. – Ralph Waldo Emerson", "Once you learn to read, you will be forever free. – Frederick Douglas", "There are many little ways to enlarge your child’s world. Love of books is the best of all. – Jacqueline Kennedy Onassis", "Wear the old coat and buy the new book. – Austin Phelps", "You may have tangible wealth untold. Caskets of jewels and coffers of gold. Richer than I you can never be — I had a mother who read to me. – Strickland Gillilan", "The man who does not read good books is no better than the man who can’t. – Mark Twain", "To learn to read is to light a fire; every syllable that is spelled out is a spark. – Victor Hugo", "Oh, magic hour, when a child first knows she can read printed words! – Betty Smith", "A book is a gift you can open again and again. – Garrison Keillor", "Fill your house with stacks of books, in all the crannies and all the nooks. – Dr. Seuss", "Show me a family of readers, and I will show you the people who move the world. – Napoléon Bonaparte", "A classic is a book that has never finished saying what it has to say. – Italo Calvino", "I have always imagined that paradise will be a kind of library. – Jorge Luis Borges", "Reading is a discount ticket to everywhere. – Mary Schmich", "No entertainment is so cheap as reading, nor any pleasure so lasting. – Mary Wortley Montagu", "If you are going to get anywhere in life you have to read a lot of books. – Roald Dahl", "That perfect tranquility of life, which is nowhere to be found but in retreat, a faithful friend and a good library. – Aphra Behn", "To acquire the habit of reading is to construct for yourself a refuge from almost all the miseries of life. – W. Somerset Maugham", "Rainy days should be spent at home with a cup of tea and a good book. – Bill Watterson", "These books gave Matilda a hopeful and comforting message: You are not alone. – Roald Dahl", "I guess there are never enough books. – John Steinbeck", "Despite the enormous quantity of books, how few people read! And if one reads profitably, one would realize how much stupid stuff the vulgar herd is content to swallow every day. – Voltaire", "Libraries will get you through times of no money better than money will get you through times of no libraries. – Anne Herbert", "Ah, how good it is to be among people who are reading. – Rainer Maria Rilke", "Children are made readers on the laps of their parents. – Emilie Buchwald", "I couldn’t live a week without a private library – indeed, I’d part with all my furniture and squat and sleep on the floor before I’d let go of the 1500 or so books I possess. – H.P. Lovecraft", "Books are good company, in sad times and happy times, for books are people – people who have managed to stay alive by hiding between the covers of a book. – E.B. White", "Luckily, I always travel with a book, just in case I have to wait on line for Santa, or some such inconvenience. – David Levithan", "Outside of a dog, a book is a man’s best friend. Inside of a dog, it’s too dark to read. – Groucho Marx", "Somebody who only reads newspapers and at best books of contemporary authors looks to me like an extremely near-sighted person who scorns eyeglasses. He is completely dependent on the prejudices and fashions of his times, since he never gets to ,see or hear anything else. – Albert Einstein" "I always read. You know how sharks have to keep swimming or they die? I’m like that. If I stop reading, I die. – Patrick Rothfuss", "There is no Frigate like a Book To take us Lands away – Emily Dickinson", "I intend to put up with nothing that I can put down. – Edgar Allan Poe", "Books are not made for furniture, but there is nothing else that so beautifully furnishes a house. – Henry Ward Beecher","I took a speed-reading course and read War and Peace in twenty minutes. It involves Russia. – Woody Allen", "There are worse crimes than burning books. One of them is not reading them. – Joseph Brodsky", "I declare after all there is no enjoyment like reading! How much sooner one tires of any thing than of a book! — When I have a house of my own, I shall be miserable if I have not an excellent library. – Jane Austen", "Books break the shackles of time – proof that humans can work magic. – Carl Sagan", "Employ your time in improving yourself by other men’s writings so that you shall come easily by what others have labored hard for. – Socrates", "For my whole life, my favorite activity was reading. It’s not the most social pastime. – Audrey Hepburn", "Reading for me, is spending time with a friend. – Gary Paulsen", "From the reading of ‘good books’ there comes a richness of life that can be obtained in no other way. – Gordon B. Hinckley", "Fools have a habit of believing that everything written by a famous author is admirable. For my part I read only to please myself and like only what suits my taste. – Voltaire", "How many a man has dated a new era in his life from the reading of a book. – Henry David Thoreau", "Reading is a basic tool in the living of a good life. – Mortimer J. Adler", "A children’s story that can only be enjoyed by children is not a good children’s story in the slightest. – C.S. Lewis", "It is a great thing to start life with a small number of really good books which are your very own. – Arthur Conan Doyle", "Finally, from so little sleeping and so much reading, his brain dried up and he went completely out of his mind. – Miguel de Cervantes Saavedra", "What better occupation, really, than to spend the evening at the fireside with a book, with the wind beating on the windows and the lamp burning bright. – Gustave Flaubert", "I’m old-fashioned and think that reading books is the most glorious pastime that humankind has yet devised. – Wisława Szymborska", "Never put off till tomorrow the book you can read today. – Holbrook Jackson", "What kind of life can you have in a house without books? – Sherman Alexie", "Of course anyone who truly loves books buys more of them than he or she can hope to read in one fleeting lifetime. A good book, resting unopened in its slot on a shelf, full of majestic potentiality, is the most comforting sort of intellectual, wallpaper. – David Quammen"]
    puts pastel.decorate("\"#{quotes.sample}\"", :cyan, :bold)
  end
  ###################
  def self.welcome
    font = TTY::Font.new(:standard)
    pastel = Pastel.new
    puts pastel.cyan(font.write("Read More"))
  end
  ###################
  def self.start_menu
    prompt = TTY::Prompt.new
    selection = prompt.select("") do |a|
      a.choice '📚  Create New Account'
      a.choice '📚  Login'
      a.choice ' '
      a.choice '❌  Exit'
    end
    case selection
    when '📚  Create New Account'
      line
      sleep 0.5
      create_account
    when '📚  Login'
      line
      sleep 0.5
      login_account
    when '❌  Exit'
      exit
    end
  end
  ###################
  def self.create_account
    prompt = TTY::Prompt.new
    clear
    bookcase
    quotation
    line
    username = prompt.ask("✏️   Please enter a username: ")

    if username == "exit"
      start_menu
    elsif !User.find_by(user_name: username)
      $current_user = User.create(user_name: username)

      puts "Hi, #{username}, It's nice to meet you!"
      sleep 1
      password = prompt.mask('🔐   Please create a your password: ')
      $current_user.update_password(password)

      puts " 💾  Password Set!"
      sleep 1

      puts "Now a few more steps to get you set up,"
      firstname = prompt.ask("✏️   Please enter your first name: ", required: true)
      lastname = prompt.ask("✏️   Please enter your last name: ", required: true)
      e_mail = prompt.ask('✏️   What is your email?'){|q| q.validate :email}
      age = prompt.ask("✏️   Please enter your age: ", required: true)

      $current_user.update_user(firstname, lastname, e_mail, age)

      user = User.last
      main_menu
    else
      choice = prompt.select("That username is already taken. Please choose another one or login.") do |a|
        a.choice 'Choose a new username'
        a.choice 'Login'
        a.choice 'Start Menu'
      end
      case choice
      when 'Choose a new username'
        create_account
      when 'Login'
        login_account
      when 'Start Menu'
        start_menu
      end
    end
  end
  #################
  def self.login_account
    prompt = TTY::Prompt.new
    clear
    bookcase
    quotation
    line
    puts "✏️   Please enter a username: "
    username = gets.chomp
    line

    if User.find_by(user_name: username)
      puts "Welcome Back #{username}!"
      line
      $current_user = User.find_by(user_name: username)
      $current_user.check_password
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
  def self.main_menu
    clear
    bookcase
    quotation
    line
    puts "Welcome Back inside your own personally library."
    line
    prompt = TTY::Prompt.new
    selection = prompt.select("Where to next?") do |a|
      a.choice '📚  View Own Books'
      a.choice '📚  View Borrowed Books'
      a.choice '📚  Add a New Book'
      a.choice '📚  Edit a Book'
      a.choice '📚  Delete a Book'
      a.choice '📚  My Account'
      a.choice ''
      a.choice '❌  Exit'
    end

    case selection
    when '📚  View Own Books'
      $current_user.my_books_list
    when '📚  View Borrowed Books'
      $current_user.my_borrowed_books_list
    when '📚  Add a New Book'
      add_new_book_menu
    when '📚  Edit a Book'
      $current_user.select_book_to_edit
    when '📚  Delete a Book'
      $current_user.select_book_to_delete
    when '📚  My Account'
      account_page
    when '❌  Exit'
      exit
    end
  end
  #######################
  def self.books_names_inner_menu
    prompt = TTY::Prompt.new
    line
    selection = prompt.select("Where to next?") do |a|
      a.choice '📚  View Borrowed Books'
      a.choice '🏠  Main Menu'
      a.choice ''
      a.choice '❌  Exit'
    end
    case selection
    when '📚  View Borrowed Books'
      $current_user.my_borrowed_books_list
    when '🏠  Main Menu'
      main_menu
    when '❌  Exit'
      exit
    end
  end
  ############################
  def self.borrowed_books_names_inner_menu
    prompt = TTY::Prompt.new
    line
    selection = prompt.select("Where to next?") do |a|
      a.choice '📚  View Own Books'
      a.choice '🏠  Main Menu'
      a.choice ''
      a.choice '❌  Exit'
    end
    case selection
    when '📚  View Own Books'
      $current_user.my_books_list
    when '🏠  Main Menu'
      main_menu
    when '❌  Exit'
      exit
    end
  end
  ############################
  def self.account_page
    # Called from MAIN_MENU
    prompt = TTY::Prompt.new
    pastel = Pastel.new
    clear
    bookcase
    quotation
    line
    puts "Hello #{$current_user.user_name}\n"
    line
    selection = prompt.select("What would you like to do today?") do |a|
      a.choice '📚  Update My Personal Details'
      a.choice '📚  Change My Password'
      a.choice '🏠  Main Menu'
      a.choice ''
      a.choice '❌  Exit'
    end
    case selection
    when '📚  Update My Personal Details'
      $current_user.update_personal_details
    when '📚  Change My Password'
      $current_user.change_password
    when '🏠  Main Menu'
      main_menu
    when '❌  Exit'
      exit
    end
  end
  ############################
  def self.add_new_book_menu
    # Called from MAIN_MENU
    prompt = TTY::Prompt.new
    clear
    bookcase
    selection = prompt.select("📚   Great, lets add a new book! How would you like to add the book?") do |a|
      a.choice '📚  Add Manually'
      a.choice '📚  Search and Add'
      a.choice '🏠  Main Menu'
      a.choice ''
      a.choice '❌  Exit'
    end
    case selection
    when '📚  Add Manually'
      $current_user.add_a_new_book_manually
    when '📚  Search and Add'
      ApiAccessor.get_input_and_search_api
    when '🏠  Main Menu'
      main_menu
    when '❌  Exit'
      exit
    end
  end
  ############################
  def self.stars(number)
    rate = number.to_i
    case rate
    when 1
       " ⭐ "
    when 2
       " ⭐ ⭐ "
    when 3
       " ⭐ ⭐ ⭐ "
    when 4
       " ⭐ ⭐ ⭐ ⭐ "
    when 5
       " ⭐ ⭐ ⭐ ⭐ ⭐ "
    end
  end
  ############################
  def self.personal_details_inner_menu
    # Called from UPDATE_PERSONAL_DETAILS
    prompt = TTY::Prompt.new
    line
    selection = prompt.select("Where To Next?") do |a|
      a.choice '📚  Change My Password'
      a.choice '🏠  Back to the Main Menu'
      a.choice ''
      a.choice '❌  Exit'
    end
    case selection
    when '📚  Change My Password'
      $current_user.change_password
    when '🏠  Back to the Main Menu'
      main_menu
    when '❌  Exit'
      exit
    end
  end
  ############################
  def exit
    clear
    bookcase
    quotation
    line
    pastel = Pastel.new
    puts pastel.cyan"Until Next Time..."
    line
    📚 👍 📚 👍 📚 👍 📚 👍 📚 👍 📚 👍 📚 👍 📚 👍 📚 👍 📚 👍
  end
  ############################
end
