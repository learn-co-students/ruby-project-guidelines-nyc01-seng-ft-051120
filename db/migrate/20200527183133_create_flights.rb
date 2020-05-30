class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.integer :airline_id
      t.datetime :date
      t.string :destination
    end
  end
end

