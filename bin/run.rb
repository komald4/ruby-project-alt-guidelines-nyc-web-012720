require_relative '../config/environment'

# system("clear")

puts "Welcome to Deepa and Komal's Wedding"
puts "**********************************"
puts "  ******************************"
puts "   ***************************"
puts "     *********************** "


def get_user_input
  puts 'What would you like to do?'
  puts '1. RSVP to our Wedding'
  puts '2. See our Menu option'
  puts "3. Can't make it? No worries. Please enter name to be removed from guest-list"
  puts "4. Exit"

  input = gets.chomp.to_i

  case (input)
  when 1
    puts "Please enter your name: " 
    my_guest

  when 2
    puts "Here are the options for lunch:
    1 Vegetarian
    2 Non-Vegetarian
    3 7 Curry "
  ##what code can I generate to display the three menu options
    puts "Looks delicious? Pease select your option:"
     guest_menu

  when 3
    puts "Stuff happens, no worries. Enter your name"
    g = my_guest
    g.destroy
    #binding.pry

  when 4
    return
  
  end
  get_user_input
end


def my_guest 
    input = gets.chomp
    g = Guest.find_or_create_by(name: input)
    g.update(RSVP: true)
    g
end 

#SELECT  "menus".* FROM "menus" WHERE "menus"."item" = ? LIMIT ?
    def guest_menu
        input = gets.chomp
         m = Menu.all.select do |menu|   
         guest << menu
        m.update(item: string)
        m
    end 
end

get_user_input
