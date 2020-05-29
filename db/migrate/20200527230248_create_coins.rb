class CreateCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :coins do |t|
      t.string :symbol
      t.string :name
      t.string :price
      t.string :price_date
      t.string :price_timestamp
      t.string :circulating_supply
      t.string :max_supply
      t.string :market_cap
      t.string :rank
      t.string :high
      t.string :high_timestamp
      t.string :one_day_pct_change
      t.string :thirty_day_pct_change
end
  end
end
