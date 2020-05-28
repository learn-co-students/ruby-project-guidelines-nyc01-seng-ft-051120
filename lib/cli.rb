class CommandLineInterface

    attr_reader :last_input, :current_user

    def call
        puts "welcome to Travel World"
        login
        menu
    end

    def login
        puts "Please enter your name to log in"
        @current_user = Passenger.find_or_create_by(name: user_input)
        puts "Your now logged in as #{current_user.name}"
    end
    def menu
        puts "What would you like to do:"
        puts "1. Write a review"
        puts "2. See all the review"
        puts "3. Write a review"
        puts "4. Write a review"
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
            else
                menu
                 break
            end
        end
    end

    def write_a_reveiw
        puts "please enter your review"
        review = current_user.reviews.build
        review.content = user_input
        puts "please enter your rating"
        review.rating = user_input
        # puts "Please choose from the list"
        # Airline.all.map 
        # review.airline = user_input
        review.save
        menu
    end


    private

    def user_input
        @last_input = gets.strip
    end
end