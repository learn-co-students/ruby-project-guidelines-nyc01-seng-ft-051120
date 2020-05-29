class CommandLineInterface

    attr_reader :last_input, :current_user, :current_city

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
        puts "1. Find a flight"
        #puts "2. See all the review"
      
        #puts "4. Update a flight"
        #puts "5. Delete a fligh"
        #puts "6. Write a review"
        
        main_menu_loop
    end



    def main_menu_loop
        while user_input != "exit"
            case last_input.to_i
            when 1
                find_flight
                break
            else
                menu
                 break
            end
        end
    end

    def check_all_flights
       Flight.all.map do |f|
        f.departure_city
       end.uniq
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
        puts "Enter departure city" 
        #flight = Flight.new
        @current_city = Flight.find_or_create_by(departure_city: user_input)
       
        #flight.departure_city = user_input      
        #puts "Enter arrival city" 
        #flight.arrival_city = user_input
        #puts "Select date"
        #flight.date = user_input
        #puts "Select class"
        #flight.travel_class = user_input
        #flight.save
        menu
    end


   # def book_a_flight
       # puts "Select one of the flights to book"
    #end



    private

    def user_input
        @last_input = gets.strip
    end

    def current_city

    end
end