class CommandLine

  def self.password_prompt(message, mask='✯')
     ask(message) { |q| q.echo = mask}
  end

  def self.start_menu
     menu = TTY::Prompt.new
     selection = menu.select("") do |a|
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

  def self.create_account
     puts "✏️   Please enter your name."
     brk
     username = gets.chomp

     if !User.find_by(name: username)
        user = User.create(name: username)

        puts "Hi, #{username}, It's nice to meet you!"

        password = password_prompt('🔐   Please create a new password.')
        user.update_password(password)

        puts "Password Set!"
        sleep 1

        User.current = user

     elsif username == "exit"
        start_menu
     else

        puts "That name is taken. Please choose another one."
        create_account
     end
  end
end
