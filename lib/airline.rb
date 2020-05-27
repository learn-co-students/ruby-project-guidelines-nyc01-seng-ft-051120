class Airline < ActiveRecord::Base
    has_many :reviews
    has_many :passengers, through: :reviews
    has_many :flights
end