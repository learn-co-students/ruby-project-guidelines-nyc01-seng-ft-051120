class CreateInventories < ActiveRecord::Migration[4.2]
    def change
      create_table :inventories do |t|
        t.string :name
        t.integer :player_id
        t.integer :item_id
      end
    end
  end