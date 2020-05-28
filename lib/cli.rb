class CommandLineInterface


    def run
        system "clear"
        # pid = fork{ exec 'afplay', "/Users/jeanmariejackman/Development/code/Mod1/project/ruby-project-guidelines-nyc01-seng-ft-051120/lib/POL-reach-the-sky-short.wav" }
        # puts ""                                                                                                                     
        # puts "     _____                                    __   _   _            _____          __          ___                  _ "
        # puts "    / ____|                                  / _| | | | |          |_   _|         X X        / (_)                | |"
        # sleep(0.25)
        # puts "   | |     __ ___   _____ _ __ _ __     ___ | |_  | |_| |__   ___    | |  ___ ___   X X  /X  / / _ ______ _ _ __ __| |"
        # sleep(0.25)
        # puts "   | |    / _` X X / / _ X '__| '_ X   / _ X|  _| | __| '_ X / _ X   | | / __/ _ X   X X/  X/ / | |_  / _` | '__/ _` |"
        # sleep(0.25)
        # puts "   | |___| (_| |X V /  __/ |  | | | | | (_) | |   | |_| | | |  __/  _| || (_|  __/    X  /X  /  | |/ / (_| | | | (_| |"
        # sleep(0.25)
        # puts "    X_____X__,_| X_/ X___|_|  |_| |_|  X___/|_|    X__|_| |_|X___| |_____X___X___|     X/  X/   |_/___X__,_|_|  X__,_|"
        # puts " "
        # puts " "
        # puts " "
        # puts " "
        # puts "                                            /'X                                                         "
        # sleep(0.25)
        # puts "                                           /   X              /'X       _                               "
        # sleep(0.25)
        # puts "                                      /'.,/     X_         .,'   X     / X_                             "
        # sleep(0.25)
        # puts "                                     /            X      _/       X_  /    X     _                      "
        # sleep(0.25)
        # puts "                            X__,.   /              X    /           X/.,   _|  _/ X                     "
        # sleep(0.25)
        # puts "                           /     X_/                X  /',.,''X      X_ X_/  X/    X                    "
        # sleep(0.25)
        # puts "                           |                      _  X/   /    ',../',.X    _/      X                   "
        # sleep(0.25)
        # puts "                          /         /           _XmX  X  /    |         X  /.,/'X   _X                  "
        # sleep(0.25)
        # puts "                         /        _/           XMMmmX  X_     |          X/      X_/  X                 "
        # sleep(0.25)
        # puts "                        /        /      X     XMMMMmmX   X__   X          X_       X   X_               "
        # sleep(0.25)
        # puts "                       /        /        X   XMMMMMMmX      X   X           X       X    X              "
        # sleep(0.25)
        # puts "                     _/        /          X  XMMMMMMmmX      X___            X_      X_   X             "
        # sleep(0.25)
        # puts "                    /         /            XXMMMMMMMMmmX____.'  /X_            X       X   X_           "
        # sleep(0.25)
        # puts "   ________________/_________/             /'.,___________...,,'   X            X   X        X________________________ "
        # puts " "
        # puts " "
        # sleep(0.25)
        # puts " "
        # puts " "
        puts "Welcome to Cavern of the Ice Wizard!!  Would you like instructions?"
        reply = gets.chomp
        if reply.downcase == "yes"
            puts "The story begins at the entrance of a dark cave. Legend holds that an evil Ice Wizard lurks deep within the cavern,"
            puts "with all the gold and treasure that he has plundered from many an unsuspecting traveller. If you defeat the Wizard,"
            puts "you will claim ALL the treasure and WIN the game. However, many have tried, and were not seen again for a thousand years!"
            puts "Go forth! But be stealthy, attentive, and prudent in your decisions. You can move through the game with simple one- or"
            puts "two-word commands, such as: LOOK, GET, USE, GO NORTH, or USE ITEM. At any time during your journey, type “info” to get"
            puts "information on how to exit your journey, health and strength, etc."
            puts " "
            puts "You are standing at the entrance of a dark cave..."
        elsif reply.downcase == "no"
            puts "You are standing at the entrance of a dark cave..."
        end
        command = gets.chomp
        if command.downcase == "info"
            # puts "To save and exit the game early, type SAVE and then QUIT. "
            puts "To get info on your current health points, type HEALTH."
            puts "To find out your attack points type STRENGTH. To find out what’s in your inventory, type ITEMS."
            puts "To find out information about items you see in the game or in your inventory type the item’s name"
            # puts "If you feel stuck, you *can* get a hint, by typing HELP…*but* beware!! You will lose health points each time you do it!"
        end
        # health = Player.health
        # report = gets.chomp
        # if report = "health"
        #     puts "You currently have #{health} points"
        # end
        report = gets.chomp
        if report.downcase == "health"
            puts "You currently have 30 health points"
        elsif report.downcase == "strength"
            puts "You currently have 50 attack points"
        end



       




    
        # puts "               XX"
        # puts "                 XX"
        # puts "               _ XX"
        # puts "            .' . XX '."
        # puts "           '_ '_XX_'  `_"
        # puts "           .  . XX  .  ."
        # puts "          .  . XX  .  ."
        # puts "         .==. ` XX' .'"
        # puts "  .Y|   (|bd|)   X,"
        # puts "  Y_'`._(|__|)_.'`.;"
        # puts "    `.__      __,' XX"
        # puts "        |    |      XX"
        # puts "        |    |       `"
        # puts "        |    |"
        # puts "        |    |"
        # puts "        |____|"
        # puts "       =='  '=="

        

  

        # puts " .------,"
        # puts ",'_____,'|"
        # puts "|    XX| |"
        # puts "|  o   | |"
        # puts "| )|(  | |"
        # puts "|  |   | |"
        # puts "| XX   | ;"
        # puts "|______|'._"
        # puts "   `._     `;"
        # puts "      `-._.'"
        
        
        endgame = gets.chomp
        if endgame.downcase == "quit"
            puts "Have a Good Day!"
        end
    end
        

end