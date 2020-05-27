Player.delete_all
Item.delete_all
Inventory.delete_all

#players table
10.times do
    Player.create({
        name: Faker::FunnyName.name,
        health: 20,
        attack_power: 20
    })
end

#items table
10.times do
    Item.create({
        name: Faker::Lorem.words(number: 1),
        health: rand(-10..30),
        attack: rand(-10..30)
    })
end

#inventories table
10.times do
    Inventory.create({
        player_id: Player.all.sample.id,
        item_id: Item.all.sample.id
    })
end
