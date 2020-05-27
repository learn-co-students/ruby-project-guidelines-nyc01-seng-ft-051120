Airline.delete_all
Passenger.delete_all
Review.delete_all
Flight.delete_all
Booking.delete_all

jb = Airline.create(name: "Jet Blue")
dt = Airline.create(name: "Delta")

pas1 = Passenger.create(name: "Tony", address: "New York")
pas2 = Passenger.create(name: "Conor", address: "New Jersey")

rev1 = Review.create(airline: jb, passenger: pas2, rating: 5, content: "Nice")
rev2 = Review.create(airline: dt, passenger: pas1, rating: 3, content: "Poor")

fl1 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), destination: "Chicago")
fl2 = Flight.create(airline: jb, date: Time.parse("Nov 8 2020 11:19"), destination: "San Jose")

bk1 = Booking.create(travel_class: "First", price: 500, passenger: pas1, flight: fl1)
bk2 = Booking.create(travel_class: "Economy", price: 250, passenger: pas2, flight: fl2)