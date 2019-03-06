VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def display_results(choice, computer_choice)
  if wins?(computer_choice, choice)
    prompt "The computer wins!"
  elsif wins?(choice, computer_choice)
    prompt "You win!"
  else
    prompt "It's a tie!"
  end
end

def wins?(choice1, choice2)
  wins = [["paper", "rock"], ["rock", "scissors"], ["scissors", "paper"]]
  wins.include?([choice1, choice2])
end

prompt "Welcome to ** ROCK, PAPER, SCISSORS *** !"
loop do
  choice = ""
  prompt("Choose one: #{VALID_CHOICES.join(', ')}: ")
  loop do
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)

    prompt("Please enter a valid choice!")
  end

  computer_choice = VALID_CHOICES.sample

  prompt "The computer chooses..."
  sleep 1.3
  prompt "#{computer_choice}..."

  display_results(choice, computer_choice)

  prompt "Would you like to play again? ('y'/'n'): "
  break if gets.chomp.downcase.start_with?('n')
end

puts "See you later!"
