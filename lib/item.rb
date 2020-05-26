class Item < ActiveRecord::Base
    has_many :inventories
    has_many :players, through: :inventory
end