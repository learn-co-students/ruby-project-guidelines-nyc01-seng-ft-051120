class CreeateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :passenger_id
      t.integer :airline_id
      t.integer :rating
      t.string :content
    end
  end
end
