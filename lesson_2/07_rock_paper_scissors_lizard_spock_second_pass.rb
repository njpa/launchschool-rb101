MOVES = { "rock" => ["scissors", "lizard"],
          "paper" => ["rock", "spock"],
          "scissors" => ["paper", "lizard"],
          "lizard" => ["paper", "spock"],
          "spock" => ["rock", "scissors"] }

WINS_NEEDED = 2

def prompt(message)
  puts ">> #{message}"
end

def win?(first, second)
  MOVES[first].include?(second)
end

loop do
  player_wins = 0
  computer_wins = 0

  prompt("What's your move? (#{MOVES.keys.join(', ')})")
  player_move = ""
  loop do
    player_move = gets.chomp
    break if MOVES.include?(player_move)

    prompt("Please enter a valid move.")
  end

  computer_move = MOVES.keys.sample

  puts "Your play was #{player_move}, the computer played #{computer_move}:"
  if win?(player_move, computer_move)
    puts "You win!"
    player_wins += 1
  elsif win?(computer_move, player_move)
    puts "The computer wins!"
    computer_wins += 1
  else
    puts "It's a tie!"
  end

  if player_wins == WINS_NEEDED || computer_wins == WINS_NEEDED
    prompt("The player won #{player_wins} times, the computer won" \
           " #{computer_wins} times.")
    prompt "Would you like to play again?"
    again = gets.chomp
    break unless again.downcase.start_with?("y")
  end
end

prompt("Thanks for playing!")
