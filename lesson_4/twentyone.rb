# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

require 'pry'

DECK = [['H','A'], ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6']]+
       [['H', '7'], ['H', '8'], ['H', '9'], ['H', 'J'], ['H', 'Q'], ['H', 'K']]+
       [['C','A'], ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6']]+
       [['C', '7'], ['C', '8'], ['C', '9'], ['C', 'J'], ['C', 'Q'], ['C', 'K']]+
       [['S','A'], ['S', '2'], ['S', '3'], ['S', '4'], ['H', '5'], ['H', '6']]+
       [['S', '7'], ['S', '8'], ['S', '9'], ['S', 'J'], ['H', 'Q'], ['H', 'K']]+
       [['D','A'], ['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6']]+
       [['D', '7'], ['D', '8'], ['D', '9'], ['D', 'J'], ['D', 'Q'], ['D', 'K']]

def deal_cards (arr, num, carddeck = DECK)
  num.to_i.times do |i|
    arr << carddeck.sample
    end
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def bust?(sum)
  if sum > 21 
    true
  else
    false
  end
end

def winner?(player_total, computer_total)
  if player_total > computer_total
    return 'Player'
  elsif computer_total > player_total
    return 'Dealer'
  else
    nil
  end 
end 

def display_winner(winner)
  if winner == 'Player'
    puts "You won!!"
  elsif winner == 'Dealer'
    puts "The dealer won!"
  else 
    puts "It's a tie"
  end 
end

loop do 
  #initialize
  puts "Let's play blackjack."
  player_hand = []
  computer_hand = []
  
  #first dealing of cards
  deal_cards(player_hand, 2)
  deal_cards(computer_hand, 2)
  
  #player turn
  puts "Here's your hand: #{player_hand}"
  puts "Here's the dealer's hand: #{computer_hand[0]}"
  
  answer = nil
    loop do 
      puts "............"
      puts "Hit or stay?"
      answer = gets.chomp
      if answer.downcase.start_with?('h') 
        puts "You chose to hit."
        deal_cards(player_hand, 1)
        puts "................."
        puts "Here's your hand: #{player_hand}"
        puts "Here's the dealer's hand: #{computer_hand[0]}"
        puts ".................."
        if bust?(total(player_hand))
           break 
        else 
           nil
        end 
      elsif answer.downcase.start_with?('s')
          break
      else
        puts "Please enter a valid choice."
      end 
    end 
    
    if bust?(total(player_hand))
      puts "You busted"
      puts "You lose!"
      break
    else answer.downcase.start_with?('s')
      puts "You chose to stay!"
      "It's the dealer's turn then"
    end 
    
  #computer turn 
    puts "..........................."
    puts "Here's your hand: #{player_hand}"
    puts "The dealer now reveals both cards."
    loop do 
      puts "Here's the dealer's hand: #{computer_hand}"
      puts "........................."
      if total(computer_hand) == 18..21
        puts "Dealer chose to stay."
        break 
      elsif bust?(total(computer_hand))
        break 
      else 
          puts "Dealer chose to hit"
          deal_cards(computer_hand, 1)
          puts "Here's the dealer's hand: #{computer_hand}"
      end 
    end 
  
    if bust?(total(computer_hand))
      puts "Dealer busted"
      puts "You won!"
      break
    else 
      puts "Time to check who won!" 
    end 
  
#results 
  display_winner(winner?(total(player_hand), total(computer_hand)))
  break
end