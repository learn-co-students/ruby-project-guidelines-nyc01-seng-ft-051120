class Flight < ActiveRecord::Base
    belongs_to :airline
    has_many :bookings
    has_many :passengers, through: :bookings
end