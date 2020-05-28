class CommandLineInterface


    def run
        puts "hello world"  
        self.create_new_player
    end  
        


# A User can create and save a Player
def create_new_player
    puts "Please type in your player name"
    name = gets.chomp
    player = Player.new 
    player.name = name
    player.save
    puts "Welcome #{name}"
    inspect_player
end

# A User can see the Player's attributes
def inspect_player
    puts "What would you like to do?"
    reply = gets.chomp
    if reply.downcase == "inspect" 
        # self.name = name
        # self.health = health
        # self.attack_power = attack
        puts "Report:attack points"
        puts "What would you like to do?"
    else
        puts "What would you like to do?"
    end
end


# A User can delete a Player

# A User can have many items in their inventory

# A User can view a list of their inventory items

# A User can select an item from inventory, to use, which will update player attributes, and also
# delete the item from inventory
end