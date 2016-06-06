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
    puts "You won!!"
  elsif winner == 'Dealer'
    puts "The dealer won!"
  else
    puts "It's a tie"
  end
end
loop do
  loop do
    # initialize
    puts "Let's play blackjack."
    deck = initialize_deck
    player_hand = []
    computer_hand = []

    # first dealing of cards
    deal_cards(player_hand, 2, deck)
    deal_cards(computer_hand, 2, deck)

    # player turn
    puts "Here's your hand: #{player_hand}"
    puts "Here's the dealer's hand: #{computer_hand[0]}"

    answer = nil
      loop do
        puts "............"
        puts "Hit or stay?"
        answer = gets.chomp
        if answer.downcase.start_with?('h')
          puts "You chose to hit."
          deal_cards(player_hand, 1, deck)
          puts "................."
          puts "Here's your hand: #{player_hand}"
          puts "Your current total is #{total(player_hand)}"
          puts "Here's the dealer's hand: #{computer_hand[0]}"
          puts ".................."
          if bust?(total(player_hand))
            break
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
      elsif answer.downcase.start_with?('s')
        puts "You chose to stay!"
        "It's the dealer's turn then"
      end

      # computer turn
      puts "..........................."
      puts "Here's your hand: #{player_hand}"
      puts "The dealer now reveals both cards."

      loop do
        puts "Here's the dealer's hand: #{computer_hand}"
        puts "The dealer's total is #{total(computer_hand)}"
        puts "........................."
        if total(computer_hand) >= 17 || total(computer_hand) == 21
          break
        elsif total(computer_hand) < 17
          puts "Dealer chose to hit"
          deal_cards(computer_hand, 1, deck)
        end
      end

      if bust?(total(computer_hand))
        puts "Dealer busted"
        puts "You won!"
        break
      else
        puts "Dealer chose to stay"
        puts "Time to check who won!"
      end

    # results
    prompt "You have a total of #{total(player_hand)}."
    prompt "The dealer has a total of #{total(computer_hand)}"
    display_winner(winner?(total(player_hand), total(computer_hand)))
    break
  end

  prompt "Play again? (enter y or n)"
  play_again_answer = gets.chomp
  break if play_again_answer.downcase.start_with?('n')
  prompt ".........."
end

prompt "Thanks for playing."
