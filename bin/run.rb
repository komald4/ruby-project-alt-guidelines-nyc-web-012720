        require_relative '../config/environment'
        require "tty-prompt"

        # system("clear")
        @curr_guest = nil

        puts "Welcome to Deepa and Komal's Wedding"
        puts "**********************************"
        puts "  ******************************"
        puts "   ***************************"
        puts "     *********************** "


        def get_user_input
        puts "What would you like to do?"
        puts "1. RSVP to our Wedding"
        puts "2. See our Menu option"
        puts "3. Review your menu selection" 
        puts "4. Can't make it? No worries. Please enter name to be removed from guest-list"
        puts "5. Exit"

        input = gets.chomp.to_i
        case (input)

        when 1
            puts "Please enter your name: " 
            my_guest

        when 2
            if is_current_guest_valid
                display_menus
            end
        when 3
             if is_current_guest_valid   
                puts "Review menu selection"    
                display_guest_menu_selection
            end

        when 4
             if is_current_guest_valid
                puts "Stuff happens, no worries."
                # Deletes guest menu selections
                guest_menu = get_guest_menu_selection
                guest_menu.each do |guest_menu|
                    guest_menu.destroy
                end
                
                # Deletes the current user
                @current_guest.destroy
                @current_guest = nil
            end

        when 5
            return
        
        end
        get_user_input
        end

            def my_guest 
                if @current_guest == nil
                    input = gets.chomp
                    g = Guest.find_or_create_by(name: input)
                    g.update(RSVP: true)
                    @curr_guest = g
                end
            end 

        #SELECT  "menus".* FROM "menus" WHERE "menus"."item" = ? LIMIT ?
            def display_menus
                menus = []
                i = 1
                Menu.all.each do |menu|
                    menus.push(menu)
                    puts "#{i}. #{menu.item}"
                    i += 1
                end
                puts "Looks delicious? Pease select your option:"
                guest_menu(menus)
            end

            def guest_menu(menus)
                user_input = (gets.chomp).to_i
                menu_id = menus[user_input-1].id
                selected_menu = Menu.find(menu_id)
                Guest_Menu.find_or_create_by(menu_id: selected_menu.id, guest_id: @curr_guest.id)
            end 
            
            def get_guest_menu_selection
                guest_menus = Guest_Menu.all.select do |guest_menu|
                    guest_menu.guest_id == @curr_guest.id
                end
                guest_menus  
            end

            def display_guest_menu_selection
                guest_menus = get_guest_menu_selection
                guest_menus.each do |guest_menu|
                    puts "#{Menu.find(guest_menu.menu_id).item}"
                end
            end

            def is_current_guest_valid
                if @current_guest == nil
                    puts "**********"
                    puts " Please RSVP"
                    puts "*************"
                    return false
                else
                    return true
                end
            end
        get_user_input

