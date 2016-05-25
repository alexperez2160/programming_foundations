VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second== 'scissors') ||
  (first == 'paper' && second == 'rock') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'lizard' && second == 'spock') ||
  (first == 'spock' && second == 'spock') ||
  (first == 'scissors' && second == 'lizard') ||
  (first == 'paper' && second == 'spock' ) ||
  (first == 'spock' && second == 'rock') ||
  (first == 'lizard' && second == 'paper')
end

def lose?(player, computer)
  (player == 'rock' && computer == 'paper') ||
  (player == 'paper' && computer == 'scissors') ||
  (player == 'scissors' && computer == 'rock') ||
  (player == 'lizard' && computer == 'rock') ||
  (player == 'scissors' && computer == 'spock') ||
  (player == 'lizard' && computer == 'scissors') ||
  (player == 'spock' && computer == 'paper') ||
  (player == 'rock' && computer == 'spock') ||
  (player == 'paper' && computer == 'lizard')
end

loop do


player_score = 0
computer_score = 0

  loop do 
   choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Type r for rock, s for scissors, p for paper, sp for spock, and l for lizard")
    choice = gets.chomp

    case choice 
    when 's'
      choice = 'scissors'
    when 'r'
        choice = 'rock'
    when 'p'
        choice = 'paper'
    when 'sp'
        choice = 'spock'
    when 'l' 
        choice = 'lizard'
    else 
        prompt("Please enter a valid abbreviation.")
    end
  

  if VALID_CHOICES.include?(choice)
    break
  else
    prompt("That's not a valid choice")
  end
end

computer_choice = VALID_CHOICES.sample

puts("You chose #{choice}. The computer chose #{computer_choice}.")

  if win?(choice, computer_choice)
    prompt("You won this round.")
  elsif lose?(choice, computer_choice)
    prompt("You lost this round.")
  else 
    prompt("It's a tie.")
  end
  

  if win?(choice, computer_choice)
    player_score += 1 
  else 
    computer_score += 1 
  end 

prompt("The current score:")
prompt("player: #{player_score}")
prompt("computer: #{computer_score}")


  if player_score == 5 && player_score>computer_score
    prompt("You won")
    break 
  elsif computer_score == 5 && computer_score>player_score 
    prompt("You lost")
    break
  elsif computer_score == 5 && player_score == 5
    prompt("It's a tie")
    break
  end 
  end


prompt("Do you want to play again?")
answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye.")
