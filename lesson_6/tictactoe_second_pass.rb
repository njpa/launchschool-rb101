require 'colorize'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
MARKING_PLAYER = 'X'
MARKING_COMPUTER = 'O'
MARKING_EMPTY = ' '
GAMES_PER_MATCH = 2

def build_board
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

def display_scoreboard(score)
  puts "================".yellow
  puts "|  SCOREBOARD  |".yellow
  puts "|--------------|".yellow
  puts "| PLAYER: #{score[:wins_player]}    |".yellow
  puts "| COMPUTER: #{score[:wins_computer]}  |".yellow
  puts "| TIES: #{score[:ties]}      |".yellow
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

def display(board, score)
  system("clear") || system("cls")

  display_banner
  display_scoreboard(score)
  display_board(board)

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
    puts "Select a box... #{joinor(empty_squares)}: "
    square = gets.chomp.to_i
    break if empty_squares.include?(square)
    puts "Sorry, that's not a valid square!"
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

def assess_computer_options(board, opportunities, threats, center_empty)
  if opportunities.size > 0
    square = opportunities[0].select { |sq| board[sq] == MARKING_EMPTY }.first
    puts "Opportunities(s) at #{opportunities}, beating you at #{square}!"
  elsif threats.size > 0
    square = threats[0].select { |sq| board[sq] == MARKING_EMPTY }.first
    puts "Threat(s) at #{threats}, blocking you at #{square}!"
  elsif center_empty
    square = 5
    puts "Empty center, I'll take that thank you very much!"
  else
    square = random_square(board)
    puts "No opportunities or threats... guess I'll move to #{square}"
  end

  square
end

def process_computer_move(board)
  opportunities = risky_lines(board, MARKING_COMPUTER)
  threats = risky_lines(board, MARKING_PLAYER)
  center_empty = board[5] == MARKING_EMPTY

  square = assess_computer_options(board, opportunities, threats, center_empty)

  sleep(3)
  make_move!(board, square, MARKING_COMPUTER)
end

def player_turn(board, score)
  square = prompt_square(empty_squares(board))
  make_move!(board, square, MARKING_PLAYER)
  display(board, score)

  if win?(board, MARKING_PLAYER)
    puts "Congratulations, that's a win for you!"
    score[:wins_player] += 1
    score[:last_winner] = :player
    :win
  elsif board_full?(board)
    puts "It's a tie!"
    score[:ties] += 1
    :tie
  else
    :nothing
  end
end

def computer_turn(board, score)
  process_computer_move(board)
  display(board, score)

  if win?(board, MARKING_COMPUTER)
    puts "That's a win for me! Better luck next time."
    score[:wins_computer] += 1
    score[:last_winner] = :computer
    :win
  elsif board_full?(board)
    puts "It's a tie!"
    score[:ties] += 1
    :tie
  else
    :nothing
  end
end

def play_game(board, score)
  display(board, score)

  loop do
    if score[:last_winner] == :player
      break unless player_turn(board, score) == :nothing
      break unless computer_turn(board, score) == :nothing
    else
      break unless computer_turn(board, score) == :nothing
      break unless player_turn(board, score) == :nothing
    end
  end
end

def prompt_game
  score = { wins_player: 0, wins_computer: 0, ties: 0, last_winner: :player }

  loop do
    board = build_board()
    play_game(board, score)

    if score[:wins_player] == GAMES_PER_MATCH
      puts "Congratulations, you won the game!"
      break
    elsif score[:wins_computer] == GAMES_PER_MATCH
      puts "Sorry, you lost the game!"
      break
    else
      puts "I'm preparing a new board..."
      sleep(2)
    end
  end
end

def main
  loop do
    prompt_game
    puts "Would you like to play again? (y/n)"
    break if gets.chomp.downcase == 'n'
  end
  puts "Thanks for playing Tic Tac Toe!"
end

main()

=begin debugging
board = {1 => "X", 2 => " ", 3 => " ",
         4=> "O", 5 => "O", 6 => " ",
         7 => " ", 8 => " ", 9 => " "}
process_computer_move(board)
=end
