class AddDepartureCityAndArrivalCityToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :departure_city, :string
    add_column :flights, :arrival_city, :string
  end
end
