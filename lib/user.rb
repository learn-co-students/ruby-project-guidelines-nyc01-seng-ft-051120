class User < ActiveRecord::Base
  has_many :user_coins
  has_many :coins, through: :user_coins

  def view_coin(coin_name)
   coin.find_by(name: coin_name)
 end

  def add_coin(coin_name)
    coin = view_coin(coin_name)
     UserCoin.create(user_id: self.id, coin_id: coin.id)
  end

  def delete_coin(coin_name)
    coin = view_coin(coin_name)
      coin_to_destroy = UserCoin.find_by(coin_id: coin.id)
       coin_to_destroy.destroy
  end

end
