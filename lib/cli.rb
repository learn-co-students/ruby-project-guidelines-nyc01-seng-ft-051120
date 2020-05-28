class CommandLineInterface


    def run
        puts "hello world"  
        self.create_new_player
       
    end  
    # A User can create and save a Player
    def create_new_player
        puts "Please type in your player name"
        sleep(0.25)
        puts "    "
        name = gets.chomp
        player = Player.new 
        player.name = name
        player.save
        puts "Welcome #{name}"
        sleep(0.25)
        puts "    "
        #needs to return to a menu of choices( go, inspect, get item, use item, delete, quit)
        game_options    
    end

    def name
        name = Player.last.name
    end
    
    def health
        health = Player.last.health
    end

    def strength
        strength = Player.last.attack_power
    end

    def player
        player = Player.last
    end
        
    def game_options
        sleep(0.25)
        puts "    "
        puts "What would you like to do?"
        sleep(0.25)
        puts "    "
        # puts "You can say 'create' to create new player"
        # puts "You can say 'log in' to enter your player name and start a new game"
        puts "You can say 'inspect' to inspect your player stats"
        puts "You can say 'delete' to delete your most recent created player"
        puts "You can say 'go' to enter the game"
        sleep(0.25)
        puts "    "
        reply = gets.chomp
        if reply.downcase == "inspect"
        inspect_player      
        elsif
            reply.downcase == "delete"
            delete_player
        
        elsif
            reply.downcase == "go"
            enter_game
            #ideally this would create a new instance of "Game"
            
        else
            puts "oops, try again"
            # game_options
        end
    end
        






    # A User can see the Player's attributes
    def inspect_player
        puts "type yes to see stats"
        reply = gets.chomp
        if reply.downcase == "yes" 
            puts "Report:  #{name}, you have #{health} health, and #{strength} attack points"
            game_options
        else
                #needs to return to a menu of choices( go, inspect, get item, delete, quit)
            game_options
        end
    end

    def delete_player
        puts "Are you sure you want to delete this player?"
        answer = gets.chomp
        if answer.downcase == "yes"
        # puts "Do you really want to delete this player and quit this round?"
        # response = gets.chomp
        # if response.downcase == "yes"
            player.delete
            puts "You have deleted this player!"
            #need method for create new? or exit game?
            run
        else 
            puts "What would you like to do?"
                #needs to return to a menu of choices( go, inspect, get item, delete, quit)
            game_options
        end
    end



    # A User can delete a Player

    # A User can play the game
    def enter_game
        puts "You have entered the cave text...etc"
        puts "interior cave text"
        puts "  "
        puts "You see a passage and a tunnel"
        puts "Will you enter the passage or the tunnel?"
        reply = gets.chomp
        if reply.downcase == "passage"
            puts "you enter the passage"
        elsif
            reply.downcase == "tunnel"
            puts "you enter the tunnel"
        else
            puts "sorry, I didn't understand"
            puts "please type 'passage' or 'tunnel' to continue the game"
            puts "or type 'exit' to quit the game"
            game_options
        end
    end

    # A User can have many items in their inventory

    # A User can view a list of their inventory items

    # A User can select an item from inventory, to use, which will update player attributes, and also
    # delete the item from inventory

    def exit_game
        puts "Thank you for playing!"
        puts "Come again soon!"
    end
end