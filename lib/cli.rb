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
        puts "2. Update a flight"
        puts "3. Delete a flight"
        puts "4. Write a review"
        puts "5. See all the review"
        puts "6. Update a review and rating"
        main_menu_loop
    end



    def main_menu_loop
        while user_input != "exit"
            case last_input.to_i
            when 1
                find_flight
                break
            when 2
                update_a_flight
                break
            when 3
                delete_a_flight
            when 4
                write_a_review
                break
            when 5
                see_all_the_review
                break
            when 6
                update_reviews
                break
            else
                menu
                 break
            end
        end
    end

    # def check_all_flights
    #    Flight.all.map do |f|
    #     f.departure_city
    #    end.uniq
    # end

    def find_flight
        puts "Enter departure city" 
        #flight = Flight.new
        @current_city = Flight.find_or_create_by(departure_city: user_input)
        Flight.all.map do |f|
            f.departure_city == current_city
            f.departure_city
        end  
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


    def write_a_review
       puts "please enter your review"
       review = current_user.reviews.build
       review.content = user_input
        puts "please enter your rating"
        review.rating = user_input
        puts "Please choose from the list"
        Airline.all.map 
        review.save
        menu
    end

    def see_all_the_review
        puts "Review by you #{current_user.name}"
        current_user.reviews.each { |r| puts "Review Id 16#{r.id} comment #{r.content} rating #{r.rating}"} 

        puts "Enter the review ID you'd like to update"
        if user_input.to_i > 0
            update_review_rating
        else
            menu
        end
    end

    def update_review_rating
        puts "Loading review and rating #{last_input}..."
        current_user.reviews.find(review_id: last_input)
        # current_user.reviews.each do |r| 
        # binding.pry
            puts "Enter your updated review"
            reviews.content = user_input
            puts "Enter your updated rating"
            reviews.rating = user_input
        #     r.save
       
        # end
    end



   # def book_a_flight
       # puts "Select one of the flights to book"
    #end



    private

    def user_input
        @last_input = gets.strip
    end

    def current_airline
        @current_airline = Airline.find_or_create_by(name: user_input)
    end
    # def current_city

    # end
end