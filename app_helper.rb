require_relative './config/environment'
require 'pry'
require 'rest-client'

def run_app
  @top_one_hundred = Coin.all[0..99]

    def display_coin_data(coin_name)
    chosen_coin = Coin.find_by(name: "#{coin_name}")
    puts CLI::UI.fmt "coin:".colorize(:blue).on_white + " {{*}}" + "#{chosen_coin.name}".colorize(:white).bold
    puts "Symbol:" + " #{chosen_coin.symbol}".colorize(:white).bold
    puts "Name:" + " #{chosen_coin.name}".colorize(:light_yellow)
    puts "Price:" + " #{chosen_coin.price}".colorize(:green)
    puts "Price date:" + " #{chosen_coin.price_date}".bold
    puts "Price timestamp: #{chosen_coin.price_timestamp}".bold
    puts "Circulating supply:" + " #{chosen_coin.circulating_supply}".colorize(:green)
    puts "Market cap:" + "#{chosen_coin.market_cap}".colorize(:green)
    puts "Rank:" + " #{chosen_coin.rank}".colorize(:yellow)
    puts "High:" + " #{chosen_coin.high}".colorize(:green)
    puts "High timestamp: #{chosen_coin.high_timestamp}".bold
    puts "One day movement:".colorize(:white) + " #{chosen_coin.one_day_pct_change}".colorize(:light_cyan)
    puts "Thirty day movement:".colorize(:white) + " #{chosen_coin.thirty_day_pct_change}".colorize(:light_magenta)
    end

    def view_top_coins
     @top_one_hundred.each do |coin|
       display_coin_data(coin.name)
     end
    end

    def view_data_prompt

    CLI::UI::Prompt.ask('Which data would you like to view?'.colorize(:white).bold) do |handler|
    handler.option('By coin')  { |selection|

      CLI::UI::Prompt.ask('please select a coin:'.colorize(:white).bold) do |handler|
      Coin.all[0..99].map { |s| handler.option(s.name) { |selection2|
        display_coin_data("#{selection2}")
        puts "please sign up to start tracking this coin!".colorize(:white).bold
            }
           }
        end
        view_data_prompt
       }

    handler.option('Top 100 coins') { |selection|
    view_top_coins
    view_data_prompt
    }

    handler.option('back ↩')  { |selection| run_app } #run_app

    end
    end

    #sign in
    def sign_in
    exit = false
    puts "Please enter your user name to sign in:".colorize(:white).bold
    user_name = gets.strip
    user = User.find_by(name: user_name)

    if user
     until exit == true
    puts "Welcome #{user.name},".colorize(:white).bold
    puts "You currently have #{user.coins.count} coins saved.".colorize(:white).bold

    CLI::UI::StdoutRouter.enable
    CLI::UI::Frame.open('Menu') do
    CLI::UI::Prompt.ask('please select a category to view current market data:'.colorize(:white).bold) do |handler|
    handler.option('My coins')  { |selection|
        if user.coins.empty?
          puts "You have not added any coins."
        else
          CLI::UI::Prompt.ask('please select a coin:'.colorize(:white).bold) do |handler|
            user.coins.map { |s| handler.option(s.name) { |selection1| display_coin_data("#{selection1}")
            if user.coins.map { |s| s.name }.include?(selection1)
             CLI::UI::Prompt.ask('Would you like to stop tracking this coin?'.colorize(:white).bold) do |handler|
                 handler.option("Yes") { |selection8| user.coins.delete(Coin.find_by(name: selection1)) }
                 handler.option("No") { |selection9| puts "This coin is being tracked." }
               end
            else
              CLI::UI::Prompt.ask('Would to start tracking this coin?'.colorize(:white).bold) do |handler|
                  handler.option("Yes") { |selection10| user.coins.push(Coin.find_by(name: selection1)) }
                  handler.option("No") { |selection11| puts "coin is not being tracked." }
                end
             end

            }
          }
           end
        end
       }

    handler.option('Top 100 coins')  { |selection2|
         CLI::UI::Prompt.ask('please select a coin:'.colorize(:white).bold) do |handler|
           Coin.all[0..99].map { |s| handler.option(s.name) { |selection3| display_coin_data("#{selection3}")

                if user.coins.map { |s| s.name }.include?(selection3)
                 CLI::UI::Prompt.ask('Would you like to stop tracking this coin?'.colorize(:white).bold) do |handler|
                     handler.option("Yes") { |selection4| user.coins.pop(Coin.find_by(name: selection3)) }
                     handler.option("No") { |selection5| puts "This coin is being tracked." }
                   end

                else
                  CLI::UI::Prompt.ask('Would you like to start tracking this coin?') do |handler|
                      handler.option("Yes") { |selection6| user.coins.push(Coin.find_by(name: selection3)) }
                      handler.option("No") { |selection7| puts "coin is not being tracked." }
                    end
                 end
                 }
               }
            end
           }

    handler.option('Coins on the move') { |selection|
    c = Coin.all.select { |c| c.one_day_pct_change.to_f >= 0.05 ? display_coin_data(c.name) : nil }
     p c
    }

    handler.option('Find a coin')  { |selection|
      puts "Please enter a coin name:".colorize(:white).bold
      coin_name = gets.strip
      coin = Coin.find_by(name: coin_name)

      if !coin.nil?
       display_coin_data(coin.name)
      else
       puts "Not Found".colorize(:red).bold
      end

    }

    handler.option('Settings') { |selection|
     CLI::UI::Prompt.ask('') do |handler|

       handler.option('change profile name') { |selection|
        puts "Please enter a new profile name:".colorize(:white).bold
        input = gets.strip
        if User.all.map { |u| u.name}.include?(input)
          puts "This username is taken, Please choose a different user name.".colorize(:white).bold
        else
        user.update(name: input)
        puts "You name has been changed to #{input}".colorize(:white).bold
       end
        }

       handler.option('delete my account') { |selection|
            user.destroy
            puts "Your account has been ".colorize(:white).bold + "deleted".colorize(:red).bold
            exit = true
         }
       handler.option('back ↩') { |selection|  }

     end
    }

    handler.option('Log out') { |selection| exit = true }

    end
    end
    end

    else
      puts "User name not found, please sign up.".colorize(:red).bold

    end

    end

    #sign up method
    def sign_up
     puts "Please enter your new user name:".colorize(:White).bold
     user_name = gets.strip
     if User.all.map { |u| u.name }.include?(user_name)
       puts "User name already taken, please choose a different user name.".colorize(:white).bold
     else
     User.create(name: user_name)
     puts "You have created a user:".colorize(:green) + " #{user_name}.".colorize(:white).bold
     sign_in
     end
     run_app
    end

    #begin
    CLI::UI::StdoutRouter.enable
    CLI::UI::Frame.open('Coin-Market-Watch v.1.0'.colorize(:White).bold) do
    # CLI::UI::Frame.open('Frame 2') { puts "inside frame 2" }
    puts "Welcome to Coin-Market-Watch!".colorize(:White).bold
    puts "Please sign up to save most relevant coins, and view them later!".colorize(:White).bold
    end

    CLI::UI::Prompt.ask('Make a selection below to access current cryptocurrency market data:'.colorize(:White).bold) do |handler|
    #sign in option
    handler.option('sign in')  { |selection|
      sign_in
      run_app
      }
    #sign up option
    handler.option('sign up')  { |selection|
    sign_up
       }
    #view data
    handler.option('view data')   { |selection|
      view_data_prompt
    }
    #exit
    handler.option('exit')   { |selection|
    puts "Goodbye!".colorize(:yellow)

    }
    end
end
