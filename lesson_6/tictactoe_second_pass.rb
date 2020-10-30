require 'colorize'
require 'pry'

GAMES_NEEDED = 2
CENTER_SQUARE = 5
MARKING_EMPTY = ' '
MARKING_PLAYER = 'X'
MARKING_COMPUTER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
FIRST_PLAYER = :choose

def new_board
  (1..9).each_with_object({}) { |square, board| board[square] = MARKING_EMPTY }
end

def display_banner
  puts " _   _        _               _              ".blue
  puts "| | (_)      | |             | |             ".blue
  puts "| |_ _  ___  | |_ __ _  ___  | |_ ___   ___  ".blue
  puts "| __| |/ __| | __/ _` |/ __| | __/ _ \\ / _ \\ ".blue
  puts "| |_| | (__  | || (_| | (__  | || (_) |  __/ ".blue
  puts " \\__|_|\\___|  \\__\\__,_|\\___|  \\__\\___/ \\___| ".blue
  puts
end

def display_scoreboard(player_score, computer_score, ties)
  puts "================".yellow
  puts "|  SCOREBOARD  |".yellow
  puts "|--------------|".yellow
  puts "| PLAYER: #{player_score}    |".yellow
  puts "| COMPUTER: #{computer_score}  |".yellow
  puts "| TIES: #{ties}      |".yellow
  puts "================".yellow
  puts
end

def display_board(board)
  display_row([board[1], board[2], board[3]])
  display_board_crossline
  display_row([board[4], board[5], board[6]])
  display_board_crossline
  display_row([board[7], board[8], board[9]])
end

def display_row(row)
  puts "     |     |     ".light_black
  puts "  " + [row[0], row[1], row[2]].join("  |  ".light_black)
  puts "     |     |     ".light_black
end

def display_board_crossline
  puts "-----+-----+-----".light_black
end

def display(game_state)
  system("clear") || system("cls")
  display_banner
  display_scoreboard(game_state[:wins_player],
                     game_state[:wins_computer],
                     game_state[:ties])
  display_board(game_state[:board])
  puts
end

def empty_squares(board)
  board.select { |_square, value| value == MARKING_EMPTY }.keys
end

def random_square(board)
  empty_squares(board).sample
end

def make_move!(board, square, player_marker)
  board[square] = player_marker
end

def board_full?(board)
  board.none? { |_square, marking| marking == MARKING_EMPTY }
end

def win?(board, marking)
  WINNING_LINES.any? do |line|
    board[line[0]] == marking &&
      board[line[1]] == marking &&
      board[line[2]] == marking
  end
end

def joinor(numbers)
  return numbers[0] if numbers.size == 1
  return "#{numbers[0]} or #{numbers[1]}" if numbers.size == 2
  numbers[0..-2].join(', ') << " or #{numbers[-1]}"
end

def prompt_square(empty_squares)
  square = 0
  loop do
    puts "Please select a square... #{joinor(empty_squares)}: "
    square = gets.chomp.to_i
    break if empty_squares.include?(square)
    puts "Sorry, that is not a valid square!"
  end
  square
end

def risky_lines(board, marking)
  lines = []
  WINNING_LINES.each do |line|
    count_marked = line.count { |square| board[square] == marking }
    count_empty = line.count { |square| board[square] == MARKING_EMPTY }
    lines << line if count_marked == 2 && count_empty == 1
  end
  lines
end

def show_lines_in_text(lines)
  formatted = lines.map { |line| line.join('|') }
  joinor(formatted)
end

def output_opportunities(opportunities, decision)
  wording_opportunities =
    opportunities.size > 1 ? "some opportunities" : "an opportunity"
  wording_lines = show_lines_in_text(opportunities)
  text = "Hmm... I see #{wording_opportunities} at #{wording_lines}, " \
         " I'll mark #{decision}!"
  prompt_thought_bubble(text)
end

def prompt_thought_bubble(text)
  puts "COMPUTER: "
  puts "oO( #{text} )".cyan
end

def output_threats(threats, decision)
  wording_threats = threats.size > 1 ? "some threats" : "a threat"
  wording_lines = show_lines_in_text(threats)
  text = "Hmm... I see #{wording_threats} at #{wording_lines}, " \
         "I'll block at #{decision}!"
  prompt_thought_bubble(text)
end

def evaluate_options(board, opportunities, threats, center_empty)
  if opportunities.size > 0
    square = opportunities[0].select { |sq| board[sq] == MARKING_EMPTY }.first
    output_opportunities(opportunities, square)
  elsif threats.size > 0
    square = threats[0].select { |sq| board[sq] == MARKING_EMPTY }.first
    output_threats(threats, square)
  elsif center_empty
    square = CENTER_SQUARE
    prompt_thought_bubble("What? Empty center square? " \
                          "I'll take it thank you very much!")
  else
    square = random_square(board)
    puts "No opportunities or threats... guess I'll mark square #{square}"
  end

  square
end

def process_move(board)
  opportunities = risky_lines(board, MARKING_COMPUTER)
  threats = risky_lines(board, MARKING_PLAYER)
  center_empty = board[CENTER_SQUARE] == MARKING_EMPTY

  square = evaluate_options(board, opportunities, threats, center_empty)

  sleep(3)
  make_move!(board, square, MARKING_COMPUTER)
end

def computer_turn(game_state)
  process_move(game_state[:board])
  display(game_state)

  if win?(game_state[:board], MARKING_COMPUTER)
    puts "Computer wins! Better luck next time."
    game_state[:wins_computer] += 1
    :win
  elsif board_full?(game_state[:board])
    puts "It's a tie!"
    game_state[:ties] += 1
    :tie
  else
    :no_win_or_tie
  end
end

def player_turn(game_state)
  square = prompt_square(empty_squares(game_state[:board]))
  make_move!(game_state[:board], square, MARKING_PLAYER)
  display(game_state)

  if win?(game_state[:board], MARKING_PLAYER)
    puts "Congratulations, that's a win for you!"
    game_state[:wins_player] += 1
    :win
  elsif board_full?(game_state[:board])
    puts "It's a tie!"
    game_state[:ties] += 1
    :tie
  else
    :no_win_or_tie
  end
end

def prompt_for_first_turn
  answer = ""
  loop do
    puts "Would you like to go first? (y/n):"
    answer = gets.chomp.downcase

    break if ["n", "y"].include?(answer)

    puts "Please enter a valid response (y/n):"
  end
  answer == "y" ? :player : :computer
end

def alternate_player(current_player)
  current_player == :computer ? :player : :computer
end

def play_turn(state)
  if state[:current_player] == :player
    player_turn(state)
  else
    computer_turn(state)
  end
end

def play_turns(state)
  loop do
    break unless play_turn(state) == :no_win_or_tie
    state[:current_player] = alternate_player(state[:current_player])
  end
end

def play_round(state)
  state[:board] = new_board()
  display(state)
  if state[:first_player] == :choose
    state[:first_player] = prompt_for_first_turn
  end
  state[:current_player] = state[:first_player]
  play_turns(state)
end

def play_game(state)
  loop do
    play_round(state)

    if state[:wins_player] == GAMES_NEEDED
      puts "Congratulations, you won the game!"
      break
    elsif state[:wins_computer] == GAMES_NEEDED
      puts "Sorry, you lost the game!"
      break
    else
      puts "A new board is being prepared..."
      sleep(3)
    end
  end
end

def main
  loop do
    state = { board: {},
              wins_player: 0,
              wins_computer: 0,
              ties: 0,
              current_player: nil,
              first_player: FIRST_PLAYER }

    play_game(state)
    puts "Would you like to play again? (y/n)"
    break if gets.chomp.downcase == 'n'
  end
  puts "Thanks for playing Tic Tac Toe!"
end

main()

=begin
Bonus features:
- joinor method for improved joins
- keeps score
- computer has AI defense
- computer has AI offense
- there are computer turn refinements
  - computer takes chance to win over chance to block
  - picks the center square if available and there
    are no immediate threats or win opportunities
  - constant determines who moves first
    :choose, :player, :computer
- improved game loop (keep track of current player)
=end
