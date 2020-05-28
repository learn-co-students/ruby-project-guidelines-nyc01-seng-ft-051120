class RemoveDestinationFromFlights < ActiveRecord::Migration[5.0]
  def change
    remove_column :flights, :destination
  end
end
