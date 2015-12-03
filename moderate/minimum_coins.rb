# You are given 3 coins of value 1, 3 and 5.
# You are also given a total which you have to arrive at.
# Find the minimum number of coins to arrive at it.

def minimum_number_of_coins(number, coins, minimum_coins_history)
  (0..number + 1).each do |n|
    coin_count = n
    coins.select { |c| c <= n }.each do |coin|
      if minimum_coins_history[n - coin] + 1 < coin_count
        coin_count = minimum_coins_history[n - coin] + 1
      end
    end
    minimum_coins_history[n] = coin_count
  end
  minimum_coins_history[number]
end
coins = [1, 3, 5]
File.open(ARGV[0]).each_line do |line|
  number = line.to_i
  puts minimum_number_of_coins(number, coins, Array.new(number))
end
