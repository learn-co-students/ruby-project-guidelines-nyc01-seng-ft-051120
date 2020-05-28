class CommandLineInterface

    attr_reader :last_input, :current_user

    def call
        puts "welcome to our Airline Booking System"
        login
        menu
    end

    def login
        puts "Please enter your name to log in"
        @current_user = Passenger.find_or_create_by(name: user_input)
        puts "Your now logged in as #{current_user.name}"
    end
    def menu
        puts "Options you would you like to do:" 
        puts "1. Write a review"
        #puts "2. See all the review"
        puts "3. Book a flight"
        #puts "4. Update a flight"
        #puts "5. Delete a fligh"
        
        main_menu_loop
    end

    def main_menu_loop
        while user_input != "exit"
            case last_input.to_i
            when 1
                write_a_reveiw
                break
            when 2
                see_all_the_review
                break
            when 3 
                find_flight
                break
            else
                menu
                 break
            end
        end
    end

    #def write_a_reveiw
     #   puts "please enter your review"
      #  review = current_user.reviews.build
       # review.content = user_input
        #puts "please enter your rating"
        #review.rating = user_input
        # puts "Please choose from the list"
        # Airline.all.map 
        #review.save
        #menu
    #end

    def find_flight
        puts "Enter destination city"
        flight = Flight.new
        flight.destination = user_input
        
        flight.save
        menu
        #if Flight.departure == flight1 
       # puts "Enter arrival city"
       # puts "Select date"
        #puts "Select class"
    end

   # def book_a_flight
       # puts "Select one of the flights to book"
    #end



    private

    def user_input
        @last_input = gets.strip
    end
end