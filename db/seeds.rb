require 'rest-client'
require 'json'
Coin.destroy_all
response = RestClient.get("https://api.nomics.com/v1/currencies/ticker?key=ad71e9d7b1a082d5e104af6fddc72ac8")
data = JSON.parse(response)


data.each do |coin_hash|

 Coin.create(
   symbol: coin_hash["symbol"],
   name: coin_hash["name"],
   price: coin_hash["price"],
   price_date: coin_hash["price_date"],
   price_timestamp: coin_hash["price_timestamp"],
   circulating_supply: coin_hash["circulating_supply"],
   max_supply: coin_hash["max_supply"],
   market_cap: coin_hash["market_cap"],
   rank: coin_hash["rank"],
   high: coin_hash["high"],
   high_timestamp: coin_hash["high_timestamp"],
   one_day_pct_change: coin_hash.dig("1d", "price_change_pct"),
   thirty_day_pct_change: coin_hash.dig("30d", "price_change_pct")
 )
 end
