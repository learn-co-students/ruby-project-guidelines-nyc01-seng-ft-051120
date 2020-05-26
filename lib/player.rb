class Player < ActiveRecord::Base
    has_one :inventory
    has_many :items, through: :inventory
end