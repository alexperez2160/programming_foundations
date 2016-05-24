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
  (first == 'spock' && second == 'rock')
end

def display_results(player, computer)
    if win?(player, computer)
      prompt("You won!")
    elsif (player == 'rock' && computer == 'paper') ||
      (player == 'paper' && computer == 'scissors') ||
      (player == 'scissors' && computer == 'rock') ||
      (player == 'lizard' && computer == 'rock') ||
      (player == 'scissors' && computer == 'spock') ||
      (player == 'lizard' && computer == 'scissors') ||
      (player == 'spock' && computer == 'paper') ||
      (player == 'rock' && computer == 'spock') ||
      (player == 'paper' && computer == 'lizard')
      prompt("You lose!")
    else
      prompt("It's a tie")
    end
end

loop do
choice = ''

loop do
prompt("Choose one: #{VALID_CHOICES.join(',')}")
choice = gets.chomp

  if VALID_CHOICES.include?(choice)
    break
  else
    prompt("That's not a valid choice")
  end
end

computer_choice = VALID_CHOICES.sample

puts("You chose #{choice}. The computer chose #{computer_choice}.")

display_results(choice, computer_choice)

prompt("Do you want to play again?")
answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye.")
