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

fl1 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "NYC", arrival_city: "Santa Barbara", travel_class: "First", price: 500,)
fl2 = Flight.create(airline: jb, date: Time.parse("Nov 8 2020 11:19"), departure_city: "NYC", arrival_city: "Pittsburg", travel_class: "Economy", price: 250)
fl3 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "NYC", arrival_city: "Queens", travel_class: "First", price: 500,)
fl4 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "NYC", arrival_city: "Brooklyn", travel_class: "First", price: 500,)
fl5 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "LA", arrival_city: "Seattle", travel_class: "First", price: 500,)
fl6 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "LA", arrival_city: "Santa Monica", travel_class: "First", price: 500,)
fl7 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "LA", arrival_city: "Las Vegas", travel_class: "First", price: 500,)
fl8 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "Chicago", arrival_city: "Istanbul", travel_class: "First", price: 500,)
fl9 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "Chicago", arrival_city: "Bishkek", travel_class: "First", price: 500,)
fl10 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "Chicago", arrival_city: "Pekin", travel_class: "First", price: 500,)
fl11 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "Chicago", arrival_city: "Cairo", travel_class: "First", price: 500,)


bk1 = Booking.create( passenger: pas1, flight: fl1)
bk2 = Booking.create( passenger: pas2, flight: fl2)