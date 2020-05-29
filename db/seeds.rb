Airline.delete_all
Passenger.delete_all
Review.delete_all
Flight.delete_all
Booking.delete_all

jb = Airline.create(name: "Jet Blue")
dt = Airline.create(name: "Delta")
va = Airline.create(name: "Vargin Atlantic")

pas1 = Passenger.create(name: "Tony", address: "New York")
pas2 = Passenger.create(name: "Conor", address: "New Jersey")
pas3 = Passenger.create(name: "Tiger", address: "New Jersey")

rev1 = Review.create(airline: jb, passenger: pas2, rating: 5, content: "Nice")
rev2 = Review.create(airline: dt, passenger: pas1, rating: 3, content: "Poor")
rev3 = Review.create(airline: va, passenger: pas1, rating: 4, content: "Modarete")
rev4 = Review.create(airline: dt, passenger: pas3, rating: 5, content: "Excellent")
rev5 = Review.create(airline: jb, passenger: pas1, rating: 5, content: "I like the meal most")

fl1 = Flight.create(airline: dt, date: Time.parse("Dec 8 2015 10:19"), departure_city: "NYC", arrival_city: "Santa Barbara", travel_class: "First", price: 500,)
fl2 = Flight.create(airline: jb, date: Time.parse("Nov 5 2020 11:19"), departure_city: "NYC", arrival_city: "Pittsburg", travel_class: "Economy", price: 250)
fl3 = Flight.create(airline: dt, date: Time.parse("Jun 11 2019 1:19"), departure_city: "NYC", arrival_city: "Queens", travel_class: "First", price: 500,)
fl4 = Flight.create(airline: dt, date: Time.parse("Jan 7 2018 4:19"), departure_city: "NYC", arrival_city: "Brooklyn", travel_class: "First", price: 500,)
fl5 = Flight.create(airline: dt, date: Time.parse("Feb 12 2018 3:19"), departure_city: "LA", arrival_city: "Seattle", travel_class: "First", price: 500,)
fl6 = Flight.create(airline: dt, date: Time.parse("Dec 30 2016 7:19"), departure_city: "LA", arrival_city: "Santa Monica", travel_class: "First", price: 500,)
fl7 = Flight.create(airline: dt, date: Time.parse("Nov 23 2021 1:32"), departure_city: "LA", arrival_city: "Las Vegas", travel_class: "First", price: 500,)
fl8 = Flight.create(airline: dt, date: Time.parse("Sep 3 2019 12:19"), departure_city: "DENVER", arrival_city: "Istanbul", travel_class: "First", price: 500,)
fl9 = Flight.create(airline: dt, date: Time.parse("May 1 2020 3:19"), departure_city: "DENVER", arrival_city: "Bishkek", travel_class: "First", price: 500,)
fl10 = Flight.create(airline: dt, date: Time.parse("Mar 9 2016 8:19"), departure_city: "DEVVER", arrival_city: "Pekin", travel_class: "First", price: 500,)
fl11 = Flight.create(airline: dt, date: Time.parse("Jul 8 2017 10:19"), departure_city: "CHICAGO", arrival_city: "Cairo", travel_class: "First", price: 500,)


bk1 = Booking.create( passenger: pas1, flight: fl1)
bk2 = Booking.create( passenger: pas2, flight: fl2)
bk3 = Booking.create( passenger: pas3, flight: fl3)
bk4 = Booking.create( passenger: pas1, flight: fl4)
bk5 = Booking.create( passenger: pas2, flight: fl5)
bk6 = Booking.create( passenger: pas2, flight: fl6)
