VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

def display_results(choice, computer_choice)
  if wins?(computer_choice, choice)
    prompt "Computer wins."
  elsif wins?(choice, computer_choice)
    prompt "You win."
  else
    prompt "Tie."
  end
end

def wins?(choice1, choice2)
  wins = [["paper", "rock"],
          ["paper", "spock"],
          ["rock", "scissors"],
          ["rock", "lizard"],
          ["scissors", "paper"],
          ["scissors", "lizard"],
          ["spock", "rock"],
          ["spock", "scissors"]]
  wins.include?([choice1, choice2])
end

prompt "Welcome to ** ROCK, PAPER, SCISSORS *** !"
loop do
  computer_wins = 0
  user_wins = 0
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
    sleep 1.2
    prompt "#{computer_choice}..."

    display_results(choice, computer_choice)

    if wins?(computer_choice, choice)
      computer_wins += 1
    elsif wins?(choice, computer_choice)
      user_wins += 1
    end

    break if computer_wins == 3 || user_wins == 3
  end

  prompt <<-MSG
    The final score is...
    You: #{user_wins}
    Computer:  #{computer_wins}
  MSG

  prompt "Would you like to play again? ('y'/'n'): "
  break if gets.chomp.downcase.start_with?('n')
end
