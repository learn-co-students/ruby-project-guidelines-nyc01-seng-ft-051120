class RemoveTravelClassAndPriceFromBookings < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :travel_class
    remove_column :bookings, :price
  end
end
  