class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :health, default: 20
      t.integer :attack_power, default: 20
    end
  end
end