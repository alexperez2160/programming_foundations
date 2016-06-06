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

SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def deal_cards(arr, num, carddeck)
  num.to_i.times do
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

def bust?(cards)
  if cards > 21
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
  end
end

def display_winner(winner)
  if winner == 'Player'
    prompt "You won!!"
  elsif winner == 'Dealer'
    prompt "The dealer won!"
  else
    puts "It's a tie"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def display_score(player, dealer)
  prompt "Dealer: #{dealer}, Player: #{player}"
end

loop do
player_score = 0
computer_score = 0
  loop do
    loop do 
      # initialize
      prompt "Let's play blackjack."
      prompt "First one to reach 5 points wins!"
      deck = initialize_deck
      player_hand = []
      computer_hand = []
  
      # first dealing of cards
      deal_cards(player_hand, 2, deck)
      deal_cards(computer_hand, 2, deck)
  
      # player turn
      prompt "Here's your hand: #{player_hand}"
      prompt "Your current total is #{total(player_hand)}"
      prompt "...................."
      prompt "Here's the dealer's hand: #{computer_hand[0]}"
  
      answer = nil
        loop do
          prompt "............"
          prompt "Hit or stay?"
          answer = gets.chomp
          if answer.downcase.start_with?('h')
            prompt "You chose to hit."
            deal_cards(player_hand, 1, deck)
            prompt "................."
            prompt "Here's your hand: #{player_hand}"
            prompt "Your current total is #{total(player_hand)}"
            prompt "....................."
            prompt "Here's the dealer's hand: #{computer_hand[0]}"
            prompt ".................."
            if bust?(total(player_hand))
              break
            end
          elsif answer.downcase.start_with?('s')
            break
          else
            prompt "Please enter a valid choice."
          end
        end
  
        if bust?(total(player_hand))
          prompt "You busted"
          prompt "You lose!"
          computer_score += 1 
          display_score(player_score, computer_score)
          prompt "................."
          break
        elsif answer.downcase.start_with?('s')
          prompt "You chose to stay!"
          prompt "It's the dealer's turn then"
        end
  
        # computer turn
        prompt "..........................."
        prompt "Here's your hand: #{player_hand}"
        prompt "The dealer now reveals both cards."
  
        loop do
          prompt "Here's the dealer's hand: #{computer_hand}"
          prompt "The dealer's total is #{total(computer_hand)}"
          prompt "........................."
          if total(computer_hand) >= 17 || total(computer_hand) == 21
            break
          elsif total(computer_hand) < 17
            prompt "Dealer chose to hit"
            deal_cards(computer_hand, 1, deck)
          end
        end
  
        if bust?(total(computer_hand))
          prompt "Dealer busted"
          prompt "You won!"
          player_score += 1 
          display_score(player_score, computer_score)
          prompt "..........."
          break
        else
          prompt "Dealer chose to stay"
          prompt "Time to check who won!"
        end
  
      # results
      prompt "You have a total of #{total(player_hand)}."
      prompt "The dealer has a total of #{total(computer_hand)}"
      display_winner(winner?(total(player_hand), total(computer_hand)))
      if winner?(total(player_hand), total(computer_hand)) == 'Player'
        player_score += 1 
      elsif winner?(total(player_hand), total(computer_hand)) == 'Dealer'
        computer_score += 1 
      end
      display_score(player_score, computer_score)
      prompt "..............."

      if computer_score == 5 || player_score == 5 
        break 
      end
    end
    if computer_score > player_score && computer_score == 5
      prompt "Dealer won"
      break
    elsif player_score > computer_score && player_score == 5
      prompt "You won"
    elsif player_score == 5 && computer_score == 5
      prompt "It's a tie"
    end 
  end

  break unless play_again?
end

prompt "Thanks for playing."
