class CommandLineInterface

    attr_reader :last_input, :current_user, :current_flight

    def call
        puts "Welcome to our Airline Booking"
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
        puts "1. Book a flight"
        puts "2. List of flights"
        puts "3. Update a flight"
        puts "4. Cancel a flight"
        puts "5. Create a review"
        puts "6. See all the reviews"
        puts "7. Update a review and rating"
        puts "8. Delete a review"
        main_menu_loop
    end



    def main_menu_loop
        while user_input.downcase != "exit"
            case last_input.to_i
            when 1
                book_flight
                break
            when 2
                list_of_flight
                break
            when 3
                update_flight
                break
            when 4
                cancel_a_flight
                break
            when 5
                create_a_review
                break
            when 6
                see_the_review
                break
            when 7
                update_review
                break
            when 8
                delete_review
                break
            else
                menu
                 break
            end
        end
    end

   
    def create_a_review
       puts "please enter your review"
       review = current_user.reviews.build
       review.content = user_input
        puts "please enter your rating"
        review.rating = user_input
        puts "Please enter airline name"
        review.airline = current_airline 
        review.save
        menu
    end

    # def make_a_booking
    #     puts "Enter your location" 
    #     booking = current_user.bookings.build
    #     booking.flight = current_flight
    #     booking.save
    #     menu
    # end

    def book_flight
        puts "Enter departure city"
        departure_city = user_input.upcase
        puts "Enter arrival city"
        arrival_city = user_input.capitalize
        puts
        flight = Flight.all.where(departure_city: departure_city, arrival_city: arrival_city)

        book = Booking.new(passenger_id: @current_user.id, flight_id: flight.first.id)
        #binding.pry
        book.save
        puts "You have booked the flight "  
        menu
    end

    def see_the_review
        puts "Review by you #{current_user.name}"
        current_user.reviews.each { |r| puts "Review Id #{r.id} airline #{r.airline_id} comment #{r.content} rating #{r.rating}"} 

        puts "Enter the review ID you'd like to update"
        if user_input.to_i > 0
            update_review
        else
            menu
        end
    end

    def list_of_flight
        puts "Flight booked by you #{current_user.name}"
        current_user.flights.each { |f| puts "#{f.id}--#{f.airline_id}--#{f.date}--#{f.departure_city}--#{f.arrival_city}--#{f.travel_class}--#{f.price}"}
        puts "Enter the flight Id you'd like to update"
        if user_input.to_i > 0
            update_flight
        else
        menu
        end
    end

    def update_review
        puts "Loading review #{last_input}..."
        review = current_user.reviews.find(last_input)
        puts "Enter your updated rating"
        review.rating = user_input
        puts "Enter your updated review"
        review.content = user_input
        review.save
        puts "--#{review.rating}--#{review.content}--"
        menu
    end

    def update_flight
        puts "Loading flight #{last_input}..."
        flight = current_user.flights.find(last_input)
        puts "Enter your updated date"
        flight.date = user_input
        # puts "Enter your updated review"
        # review.content = user_input
        flight.save
        puts "--#{flight.date}----"
        menu
    end

    def delete_review
        puts "Enter the review ID you'd like to delete"
        review = current_user.reviews.find(user_input)
        review.delete
        menu
    end

    def cancel_a_flight
        puts "Enter the flight ID you'd like to delete"
        flight = current_user.flights.find(user_input)
        flight.delete
        menu
    end

    private

    def user_input
        @last_input = gets.strip.capitalize
    end

    def current_airline
        @current_airline = Airline.find_or_create_by(name: user_input)
    end

    def current_flight
        @current_flight = Flight.find_or_create_by(departure_city: user_input)
    end
    
end 
