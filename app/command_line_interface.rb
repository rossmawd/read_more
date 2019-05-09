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
    when 0
      " 💩 "
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
  def self.exit
    clear
    bookcase
    quotation
    line
    pastel = Pastel.new
    puts pastel.cyan("Until Next Time...")
    line
    📚 👍 📚 👍 📚 👍 📚 👍 📚 👍 📚 👍 📚 👍 📚 👍 📚 👍 📚 👍
  end
  ############################
  def self.easter_egg
    pastel = Pastel.new
    easter_fireworks
    clear
    line
    puts pastel.magenta("Congrats on finding the hidden area...Thanks for using our app, we hope you are enjoying it as much as we enjoyed building it! \n Continue being a life long learner, and remember the only race is with yourself! \n \nHere are some fun facts for you to look over!\n Enjoy! \n Lauren and Ross")
    line
    facts
    line
    easter_menu
  end
  ############################
  def self.easter_menu
    prompt = TTY::Prompt.new
  selection = prompt.select ("") do |a|
    a.choice '✨  More Facts'
    a.choice '🏠  Main Menu'
    a.choice '❌  Exit'
  end
  case selection
  when
    '✨  More Facts'
    facts
    easter_menu
  when
    '🏠  Main Menu'
    main_menu
  when
    '❌  Exit'
    exit
  end
end
  ############################
  def self.facts
    pastel = Pastel.new
    facts = ["In 1963, major league baseball pitcher Gaylord Perry remarked, \"They'll put a man on the moon before I hit a home run On July 20, 1969, an hour after Neil Armstrong set foot on the surface of the moon, Perry hit is first, and only, home run while playing for the San Francisco Giants.\"", "Retired basketball sensation Michael Jordan makes more money from Nike each year than all the Nike factory workers in Malaysia combined.", "The Olympic flags colors are always red, black, blue, green, and yellow rings on a field of white. This is because at least one of those colors appears on the flag of every nation on the planet.", "The average lifespan of a major league baseball: 7 pitches.", "Dueling is legal is Paraguay as long as both parties are registered blood donors.", "All major league baseball umpires must wear black underwear while on the job in case their pants split.", "In 1920, Babe Ruth out-homered very American League team.", "Babe Ruth wore a cabbage leaf under his cap to keep his head cool. He changed it every two innings.", "Every year 56,000,000 people attend major league baseball games.", "In 18th century England, gambling dens employed someone whose job was to swallow the dice if there was a police raid.", "A Costa Rican worker who makes baseballs earns about $2,750 annually. The average American pro baseball player earns $2,377,000 per year.", "There are 336 dimples on a regulation golf ball.", "The moon is moving away from the Earth at a tiny, although measurable, rate every year. 85 million years ago it was orbiting the Earth about 35 feet from the planet's surface.", "The star Antares is 60,000 times larger than our sun. If our sun were the size of a softball, the star Antares would be as large as a house.", "In Calama, a town in the Atacama Desert of Chile, it has never rained.", "At any given time, there are 1,800 thunderstorms in progress over the earth's atmosphere.", "Erosion at the base of Niagara Falls has caused the falls to recede approximately seven miles over the past 10,000 years.", "A ten-year-old mattress weighs double what it did when it was new due to debris that it absorbs over time. That debris includes dust mites (their droppings and decaying bodies), mold, millions of dead skin cells, dandruff, animal and human hair, secretions, excretions, lint, pollen, dust, soil, sand, and a lot of perspiration, which the average person loses at a rate of a quart a day. Good night!", "Every year 16 million gallons of oil runs off pavement into streams, rivers, and eventually, oceans in the United States. This is more oil than was spilled by the Exxon Valdez.", "In space, astronauts cannot cry because there is no gravity and tears can't flow.", "Most lipstick contains fish scales.", "A 'jiffy' is an actual unit of time: 1/100th of a second.", "If you have three quarters, four dimes, and four pennies you have $1.19. you also have the largest possible amount of money in coins without being able to make change for a dollar.", "Leonardo Da Vinci invented scissors.", "Recycling one glass jar saves enough energy to operate a television for three hours.", "The cigarette lighter was invented before the match.", "The main library at Indiana University sinks over an inch a year. When it was designed engineers failed to take into account the weight of all the books that would occupy the building.", "A category three hurricane releases more energy in ten minutes that all the world's nuclear weapons combined.", "There is enough fuel in full jumbo jet tank to drive an average car four times around the world.", "An average of 100 people choke to death on ballpoint pens every year.", "Antarctica is the only continent without reptiles or snakes.", "The cruise liner Queen Elizabeth 2 moves only six inches for each gallon of fuel it burns.", "San Francisco cable cars are the only National Monuments that can move.", "February 1865 is the only month in recorded history not to have a full moon.", "Nutmeg is extremely poisonous if injected intravenously.", "A rainbow can be seen only in the morning or late afternoon. It can occur only when the sun is 40 degrees or less above the horizon.", "Lightning strikes the Earth 100 times every second.", "La Paz, Bolivia has an average annual temperature below 50 degrees Fahrenheit. However, it has never recorded a zero-degree temperature. Same for Stanley, the Falkland Islands, and Punta Arenas, Chile.", "There are over 87,000 Americans on waiting lists for organ transplants.", "Catsup leaves the bottle at a rate of 25 miles per year.", "Toxic house plants poison more children than household chemicals do.", "You are more likely to be infected by flesh-eating bacteria than you are to be struck by lightning.", "According to Genesis 1:20-22, the chicken came before the egg.", "It is physically impossible for you to lick your own elbow.", "It is physically impossible for you to lick your own elbow.", "21 Odd Facts About Your Body", "It is physically impossible for you to lick your elbow.", "Like fingerprints, everyone's tongue print is different.", "Your heart beats over 100,000 times a day.", "It takes approximately 12 hours for food to entirely digest.", "A sneeze travels out your mouth at over 100 m.p.h.", "Women blink nearly twice as often as men.", "Most of the dust particles in your house are dead skin.", "There is a company that will (for $14,000) take your ashes and compress them into a synthetic diamond to be set in jewelry for a loved one.", "There are more living organisms on the skin of a single human being than there are human beings on the surface of the earth.", "The longest bout of hiccups lasted nearly 69 years.", "Babies is born without kneecaps. They appear between the ages of 2 and 6.", "Men can read smaller print than women. Women can hear better.", "Wearing headphones for just an hour will increase the bacteria in your ear by 700 times.", "If you sneeze too hard you can fracture a rib. If you try to suppress a sneeze you can rupture a blood vessel in your head or neck and die. If you keep your eyes open by force they can pop out.", "A kiss stimulates 29 muscles and chemicals that cause relaxation. Women seem to like light and frequent kisses while men like them more strenuous.", "Every time you lick a stamp, you're consuming 1/10 of a calorie.", "Our eyes are always the same size from birth, but our nose and ears never stop growing.", "The average person falls asleep in seven minutes.", "Almost everyone who reads this will try to lick their elbow.", "According to Chinese acupuncture, there is a point on the head that you can press to control your appetite. It is located in the hollow just in front of the flap of the ear.", "In a recent survey, Americans revealed that banana was their favorite smell.", "When opossums are 'playing' possum, they are not playing. They actually pass out from sheer terror.", "The two-foot long bird called a Kea that lives in New Zealand likes to eat the strips of rubber around car windows.", "Snakes are true carnivores as they eat nothing but other animals. They do not eat any type of plant material.", "The Weddell seal can travel underwater for seven miles without surfacing for air.", "According to tests made at the Institute for the Study of Animal Problems in Washington, D.C., dogs and cats, like people, are either right-handed or left-handed—that is, they favor either their right or left paws.", "An iguana can stay under water for 28 minutes.", "Crocodiles and alligators are surprisingly fast on land. Although they are rapid, they are not agile, so if you ever find yourself chased by one, run in a zigzag line. You'll lose him or her every time.", "Horses can't vomit.", "A crocodile cannot stick its tongue out.", "Butterflies taste with their feet.", "Penguins can jump as high as six feet in the air.", "All polar bears are left-handed.", "An eagle can kill a young deer and fly carrying it.", "It was discovered on a space mission that a frog can throw up. The frog vomits its entire stomach out so the organ is dangling out of its mouth. Then the frog uses its forearms to dig out all of the stomach's contents and swallows the stomach back down again.", "The leg bones of a bat are so thin that no bat can walk.", "The katydid bug hears through holes in its hind legs.", "Slugs have four noses.", "Ostriches stick their heads in the sand to look for water.", "In a study of 200,000 ostriches over a period of 80 years there were no reported cases of an ostrich burying its head in the sand.", "It's possible to lead a cow upstairs, but not downstairs.", "A shrimp's heart is in its head.", "A snail can sleep for three years.", "The chicken is one of the few things that man eats before it's born and after it's dead.", "Some dogs can predict when a child will have an epileptic seizure and even protect the child from injury. They're not trained to do this, they simply learn to respond after observing at least one attack.", "A pregnant goldfish is called a twit.", "Rats multiply so quickly that in 18 months, two rats could have over a million descendants.", "There are only three types of snakes on the island of Tasmania and all three are deadly poisonous.", "It is physically impossible for pigs to look up into the sky.", "Dolphins sleep with one eye open.", "A goldfish has a memory span of three seconds.", "A shark is the only fish that can blink with both eyes.", "Emus and kangaroos cannot walk backwards and are on the Australian coat of arms for that reason.", "The jellyfish is 95% water.", "A hippo can open its mouth wide enough to fit a 4 foot tall child inside.", "Only female mosquitoes bite.", "Most elephants weigh less than the tongue of the blue whale.", "President Bush was re-elected in 2004 by less than 31% of all eligible voters in the United States.", "President Bush was re-elected in 2004 by less than 31% of all eligible voters in the United States.", "30 Odd Historical Facts", "The world's youngest parents were age 8 and 9. They lived in China and had their child in 1910.", "Kotex was first manufactured as bandages, during WWI.", "In the 16th and 17th centuries in the country of Turkey, anyone caught drinking coffee was put to death.", "Abraham Lincoln's dog, Fido, was also assassinated.", "In England, the Speaker of the House is not allowed to speak.", "About 3,000 years ago, most Egyptians died by the time they were 30.", "The first known contraceptive was crocodile dung, used by Egyptians in 2000 B.C.", "If a statue in the park of a person on a horse has both front legs in the air, the person died in battle. If the horse has one front leg in the air, the person died as a result of wounds received in battle. If the horse has all four legs on the ground, the person died of natural causes.", "The youngest pope was 11 years old.", "Richard Versalle, a tenor performing at New York's Metropolitan Opera House, suffered a heart attack and fell 10 feet from a ladder to the stage just after singing the line, \"You can only live so long.\"", "60.7 percent of eligible voters participated in the 2004 presidential election, the highest percentage in 36 years. However, more than 78 million did not vote. This means President Bush was re-elected by less than 31% of all eligible voters in the United States.", "David Bowie used to think he was being stalked by someone who is dressed like a giant pink rabbit. Bowie noticed the fan at several recent concerts, but became alarmed when he got on a plane and the bunny was also on board.", "Dr. Samuel A. Mudd was the physician who set the leg of Lincoln's assassin, John Wilkes Booth, and whose shame created the expression for ignominy: \"His name is Mudd.\"", "Wayne's World was filmed in two weeks.", "The first Fords had engines made by Dodge.", "In Ancient Egypt , priests plucked every hair from their bodies, including their eyebrows and eyelashes.", "More than 8,100 US troops are still listed as missing in action from the Korean War.", "As of January 1, 2004, the population of the United States increases by one person every 12 seconds. There is a birth every eight seconds, an immigrant is added every 25 seconds, and a death every 13 seconds.", "Inn the great fire of 1666, half of London was burnt down but only six people were injured.", "Toto was paid $125 per week while filming The Wizard of Oz.", "The only member of the band ZZ Top without a beard has the last name Beard.", "The electric chair was invented by a dentist.", "In Egypt around 1500 B.C., a shaved head was considered the ultimate in feminine beauty. Egyptian women removed every hair from their heads with special gold tweezers and polished their scalps to a high sheen with buffing cloths.", "George Lumley, aged 104, married Mary Dunning, aged 10, in Nortallerton, England on August 25, 1783. She was the great-great granddaughter of the woman who'd broken her engagement to Lumley, eighty years before.", "In Elizabethan England, the spoon was so novel and prized that people carried their own folding spoons to banquets.", "It costs more to buy a new car today in the United States than it cost Christopher Columbus to equip and undertake three voyages to and from the New World.", "Ancient Egyptians slept on pillows made of stone.", "Millie the White House dog earned more than four times as President Bush in 1991.", "A law passed in Nebraska in 1912 set hard rules of the road. Drivers in the country at night were required to stop every 150 yards, send up a skyrocket, then wait eight minutes for the road to clear before proceeding cautiously, all the while blowing their horn and shooting off flares.", "Louis XIV of France really was as unpleasant a fellow as he's been depicted. In 1674, when he was visiting a school at Clermont, he heard from the school's authorities that one of the children, a nine- year-old Irish lad named Francis Seldon, had made a pun about the king's bald head.", "Louis was furious. He had a secret warrant drawn up for the child's arrest, and young Seldon was thrown into solitary confinement in the Bastille. His parents, members of one of Europe's richest merchant families, were told simply that the child had disappeared. Days turned to months, months to years, and Louis himself passed away. But Francis spent sixty-nine years \"in the hole\" for making fun of the king's baldness.", "The microwave was invented after a researcher walked by a radar tube and the chocolate bar in his pocket melted.", "23% of all photocopier faults world-wide are caused by people sitting on them and photocopying their butts.", "\"Stewardesses\" is the longest word that is typed using only the left hand.", "71% of office workers stopped on the street for a survey agreed to give up their computer passwords in exchange for a chocolate bar.", "The electric chair was invented by a dentist.", "A Boeing 767 airliner is made of 3,100,000 separate parts.", "The first FAX machine was patented in 1843, 33 years before Alexander Graham Bell demonstrated the telephone.", "Hershey's Kisses are called that because the machine that makes them looks like it's kissing the conveyor belt.", "\"Typewriter\" is the longest word that can be made using the keys on only one row of the keyboard.", "In 1980, there was only one country in the world with no telephones: Bhutan.", "More than 50% of the people in the world have never made or received a telephone call.", "No word in the English language rhymes with month, orange, silver, or purple.", "The \"sixth sick sheik's sixth sheep's sick\" is said to be the toughest tongue twister in the English language.", "\"Go,\" is the shortest complete sentence in the English language.", "The phrase \"rule of thumb\" is derived from an old English law which stated that you couldn't beat your wife with anything wider than your thumb.", "The term \"the whole 9 yards\" came from WWII fighter pilots in the South Pacific. When arming their airplanes on the ground, the .50 caliber machine gun ammo belts measured exactly 27 feet, before being loaded into the fuselage. If the pilots fired all their ammo at a target, it got \"the whole 9 yards.\"", "There are only four words in the English language which end in \"-dous\": tremendous, horrendous, stupendous, and hazardous.", "The word \"testify\" is based on the Ancient Roman practice of making men swear on their testicles when making a statement in court.", "In England in the 1880s, \"pants\" was considered a dirty word.", "According to many language experts, the most difficult kind of phrase to create is a palindrome, a sentence or group of sentences that reads the same backward and forward. A few examples: \n \"Red rum, sir, is murder.\" \n \"Ma is as selfless as I am.\" \n \"Nurse, I spy gypsies. Run!\" \n \"A man, a plan, a canal - Panama.\" \n \"He lived as a devil, eh?\"", "The dot that appears over the letter i is called a 'tittle.'", "If you were to spell out numbers, you would you have to go until 1,000 until you would find the letter A.", "Montpelier, VT is the only U.S. state capital without a McDonalds.", "There is a bar in London that sells vaporized vodka, which is inhaled instead of sipped.", "In the White House, there are 13,092 knives, forks, and spoons.", "Americans on average eat 18 acres of pizza every day.", "Coca-cola was originally green.", "The only food that does not spoil: honey.", "The Pilgrims ate popcorn at the first Thanksgiving dinner.", "Iceland consumes more Coca-Cola per capita than any other nation.", "Almonds are members of the peach family.", "Cranberry is the only Jell-O flavor that contains real fruit flavoring.", "The drive-through line on opening day at the McDonald's restaurant in Kuwait City, Kuwait was seven miles long at its peak.", "American Airlines saved $40,000 in 1987 by eliminating one olive from each salad served first class.", "Celery has negative calories! It takes more calories to eat a piece of celery than the celery has in it to begin with.", "The average American drinks about 600 sodas a year.", "Hope this guy isn't in Topeka! It's illegal in Kansas to catch fish with your bare hands.", "Hope this guy isn't in Topeka! It's illegal in Kansas to catch fish with your bare hands.", "16 Strange Facts About the United States", "Number of US states that claim test scores in their elementary schools are above national average: 50.", "One in every four Americans has appeared on television.", "In 1998, more fast-food employees were murdered on the job than police officers.", "There are more collect calls on Father's Day than any other day of the year.", "Title 14, Section 1211, of the Code of Federal Regulations, implemented on July 16, 1969, makes it illegal for U. S. citizens to have any contact with extraterrestrials or their vehicles.", "There are more cars in Southern California than there are cows in India.", "Percentage of Americans who say that God has spoken to them: 36.", "Average number of people airborne over the US any given hour: 61,000.", "Portion of land in the US owned by the government: 1/3.", "Ninety percent of New York City cabbies are recently arrived immigrants.", "In 21 states, Wal-Mart is the single largest employer.", "It's against the law in Kansas to catch fish with your bare hands.", "Maine is the only state a one-syllable name.", "There are 2,000,000 millionaires in the United States.", "The United States has five percent of the world's population, but twenty-five percent of the world's prison population.", "It is illegal to hunt camels in the state of Arizona.", "In the United States, a pound of potato chips costs two hundred times more than a pound of potatoes.", "More than 2 billion pencils are manufactured each year in the United States. If these were laid end to end they would circle the world nine times. The average lead pencil will draw a line 35 miles long or write approximately 50,000 English words.", "Mailmen in Russia now carry revolvers after a recent decision by the government.", "One out of five people in the world (1.1 billion people) live on less than $1 per day.", "Quebec City, Canada, has about as much street crime as Disney World.", "The largest ocean liners pay a $250,000 toll for each trip through the Panama Canal. The canal generates fully one-third of Panama's entire economy.", "In every episode of Seinfeld there is a Superman somewhere.", "The Spanish word esposa means 'wife.'' The plural, esposas, means 'wives,'' but also 'handcuffs.'", "City with the most Rolls Royces per capita: Hong Kong.", "Of the six men who made up the Three Stooges, three of them were real brothers (Moe, Curly and Shemp).", "If Barbie were life-size, her measurements would be 39-23-33. She would stand 7 feet, 2 inches tall.", "On average, people fear spiders more than they do death.", "Thirty-five percent of the people who use personal ads for dating are already married.", "In Tokyo you can buy a toupee for your dog.", "A dime has 118 ridges around the edge."]
    puts pastel.decorate("\"#{facts.sample}\"", :cyan, :bold)
  end
############################
  def self.fireworks_red
    pastel = Pastel.new
    puts pastel.red("              .''.
       .''.      .        *''*    :_\/_:     .
      :_\/_:   _\(/_  .:.*_\/_*   : /\ :  .'.:.'.
  .''.: /\ :   ./)\   ':'* /\ * :  '..'.  -=:o:=-
 :_\/_:'.:::.    ' *''*    * '.\'/.' _\(/_'.':'.'
 : /\ : :::::     *_\/_*     -= o =-  /)\    '  *
  '..'  ':::'     * /\ *     .'/.\'.   '
      *            *..*         :
       *
        *
")
  end
  ############################
  def self.fireworks_blue
    pastel = Pastel.new
    puts pastel.blue("             .''.
       .''.      .        *''*    :_\/_:     .
      :_\/_:   _\(/_  .:.*_\/_*   : /\ :  .'.:.'.
  .''.: /\ :   ./)\   ':'* /\ * :  '..'.  -=:o:=-
 :_\/_:'.:::.    ' *''*    * '.\'/.' _\(/_'.':'.'
 : /\ : :::::     *_\/_*     -= o =-  /)\    '  *
  '..'  ':::'     * /\ *     .'/.\'.   '
      *            *..*         :
       *
        *
")
  end
  ############################
  def self.fireworks_yellow
    pastel = Pastel.new
    puts pastel.yellow("           .''.
       .''.      .        *''*    :_\/_:     .
      :_\/_:   _\(/_  .:.*_\/_*   : /\ :  .'.:.'.
  .''.: /\ :   ./)\   ':'* /\ * :  '..'.  -=:o:=-
 :_\/_:'.:::.    ' *''*    * '.\'/.' _\(/_'.':'.'
 : /\ : :::::     *_\/_*     -= o =-  /)\    '  *
  '..'  ':::'     * /\ *     .'/.\'.   '
      *            *..*         :
       *
        *
")
  end
  ############################
  def self.fireworks_green
    pastel = Pastel.new
    puts pastel.green("            .''.
       .''.      .        *''*    :_\/_:     .
      :_\/_:   _\(/_  .:.*_\/_*   : /\ :  .'.:.'.
  .''.: /\ :   ./)\   ':'* /\ * :  '..'.  -=:o:=-
 :_\/_:'.:::.    ' *''*    * '.\'/.' _\(/_'.':'.'
 : /\ : :::::     *_\/_*     -= o =-  /)\    '  *
  '..'  ':::'     * /\ *     .'/.\'.   '
      *            *..*         :
       *
        *
")
  end
  ############################
  def self.easter_fireworks
    fireworks_red
    sleep 0.2
    clear
    sleep 0.1
    fireworks_yellow
    sleep 0.2
    clear
    sleep 0.1
    fireworks_blue
    sleep 0.2
    clear
    sleep 0.1
    fireworks_green
    sleep 0.2
    clear
    fireworks_red
    sleep 0.2
    clear
    sleep 0.1
    fireworks_yellow
    sleep 0.2
    clear
    sleep 0.1
    fireworks_blue
    sleep 0.2
    clear
    sleep 0.1
    fireworks_green
    sleep 0.2
    clear
    fireworks_red
    sleep 0.2
    clear
    sleep 0.1
    fireworks_yellow
    sleep 0.2
    clear
    sleep 0.1
    fireworks_blue
    sleep 0.2
    clear
    sleep 0.1
    fireworks_green
    sleep 0.2
    clear
    fireworks_red
    sleep 0.2
    clear
    sleep 0.1
    fireworks_yellow
    sleep 0.2
    clear
    sleep 0.1
    fireworks_blue
    sleep 0.2
    clear
    sleep 0.1
    fireworks_green
    sleep 0.2
    clear
  end
end
