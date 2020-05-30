class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :travel_class
      t.float :price
      t.integer :passenger_id
      t.integer :flight_id
    end
  end
end
