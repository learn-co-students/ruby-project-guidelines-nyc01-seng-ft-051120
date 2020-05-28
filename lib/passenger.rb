class Passenger < ActiveRecord::Base
    has_many :reviews
    has_many :airlines, through: :reviews
    has_many :bookings
    has_many :flights, through: :bookings
end