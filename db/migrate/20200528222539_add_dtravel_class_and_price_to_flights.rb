class AddDtravelClassAndPriceToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :travel_class, :string
    add_column :flights, :price, :float
  end
end
