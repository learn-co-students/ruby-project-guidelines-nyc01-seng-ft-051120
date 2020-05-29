class CreateUserCoins < ActiveRecord::Migration[5.1]
  def change
    create_table :user_coins do |t|
      t.integer :user_id
      t.integer :coin_id
    end

  end
end
