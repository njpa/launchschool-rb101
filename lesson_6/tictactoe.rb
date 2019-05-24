# tictactoe.rb

require 'pry'
require 'colorize'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
GAMES_FOR_WIN = 5

def main
  state = {
    score: { player: 0, computer: 0 },
    board: { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ',
             5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ' },
    last_winner: :player,
    current_player: :player,
    player_marker: 'x',
    computer_marker: 'o'
  }

  loop do
    break unless game_on(state)
  end

  puts "Thanks for playing!"
end

def game_on(state)
  winner = play_game(state)

  case winner
  when :player   then puts "Nice!"
  when :computer then puts "Good try! Better luck next time."
  else                puts "Looks like it's a tie!"
  end

  if state[:score][:player] >= GAMES_FOR_WIN ||
     state[:score][:computer] >= GAMES_FOR_WIN
    false
  else
    prompt_again != 'n'
  end
end

def play_game(state)
  clear_board!(state[:board])

  winner = nil

  loop do
    display(state)
    winner = play_turn!(state)
    break if winner || board_full?(state[:board])

    alternate_player!(state)
  end

  winner
end

def play_turn!(state)
  place_piece!(state[:board], state[:current_player])

  a_win = nil

  if a_winner?(state[:board])
    increase_score!(state[:score], state[:current_player])
    state[:last_winner] = state[:current_player]
    a_win = state[:current_player]
  end

  display(state)

  a_win
end

def alternate_player!(state)
  state[:current_player] =
    state[:current_player] == :player ? :computer : :player
end

def increase_score!(score, player)
  score[player] += 1
end

def player_places_piece!(board)
  choice = nil

  loop do
    puts "Choose a square (#{joinor(empty_squares(board))}): ".green
    choice = gets.chomp.to_i

    break if empty_squares(board).include? choice

    puts "warning: Please select a valid square!".red
  end

  board[choice] = PLAYER_MARKER
end

def place_piece!(board, player)
  case player
  when :player
    player_places_piece!(board)
  else
    output_computer_thinking
    computer_places_piece!(board) if player == :computer
  end
end

def computer_places_piece!(board)
  empty = empty_squares(board)
  best_square = best_move(empty, board)
  board[best_square] = COMPUTER_MARKER
end

def best_move(empty_squares, board)
  possible_wins = possible_wins(empty_squares, board)
  blocks = empty_squares.select { |square| can_block?(square, board) }
  win_starts = empty_squares.select { |square| can_start_win?(square, board) }

  if !possible_wins.empty?
    possible_wins[0]
  elsif !blocks.empty?
    blocks[0]
  elsif win_starts.include?(5)
    5
  elsif !win_starts.empty?
    win_starts[0]
  elsif empty_squares.include?(5)
    5
  else
    empty_squares.sample
  end
end

def can_start_win?(square, board)
  wins = WINNING_LINES.select do |line|
    other_squares = line - [square]
    line.include?(square) &&
      (board[other_squares[0]] == COMPUTER_MARKER ||
      board[other_squares[1]] == COMPUTER_MARKER)
  end
  !wins.empty?
end

def possible_wins(empty_squares, board)
  empty_squares.reject do |square|
    wins = WINNING_LINES.select do |line|
      other_squares = line - [square]
      line.include?(square) &&
        board[other_squares[0]] == COMPUTER_MARKER &&
        board[other_squares[1]] == COMPUTER_MARKER
    end
    wins.empty?
  end
end

def can_block?(square, board)
  blocks = WINNING_LINES.select do |line|
    other_squares = line - [square]
    line.include?(square) &&
      board[other_squares[0]] == PLAYER_MARKER &&
      board[other_squares[1]] == PLAYER_MARKER
  end
  !blocks.empty?
end

def a_winner?(board)
  winner = false
  [COMPUTER_MARKER, PLAYER_MARKER].each do |player|
    WINNING_LINES.select do |line|
      if (line - board.keys.select { |pos| board[pos] == player }) == []
        winner = true
      end
    end
  end
  winner
end

def board_full?(board)
  empty_squares(board).empty?
end

def empty_squares(board)
  board.keys.select { |pos| board[pos] == INITIAL_MARKER }
end

def clear_board!(board)
  (1..9).each { |key| board[key] = INITIAL_MARKER }
end

def display(state)
  system 'clear'
  puts score_table(state[:score]).yellow
  puts ''
  puts board_table(state[:board])
  puts ''
end

def prompt_again
  puts "Do you want to play again (y/n)?: "
  again = ''

  loop do
    again = gets.chomp
    break if %w(y n).include? again

    puts "Please enter 'y' or 'n': "
  end

  again
end

def board_table(brd)
  "     |     |     \n" \
  "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}\n" \
  "     |     |     \n" \
  "-----+-----+-----\n" \
  "     |     |     \n" \
  "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}\n" \
  "     |     |     \n" \
  "-----+-----+-----\n" \
  "     |     |     \n" \
  "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}\n" \
  "     |     |     \n"
end

def score_table(scr)
  "┌------┬-------┬-----┬-----┐\n" \
  "|      | SCORE | MRK | CUR |\n"\
  "├------+-------+-----+-----┤\n" \
  "| You  |   #{scr[:player]}   |  #{PLAYER_MARKER}  |     |\n"\
  "| Comp |   #{scr[:computer]}   |  #{COMPUTER_MARKER}  |     |\n"\
  "└------┴-------┴-----┴-----┘\n"
end

def joinor(elements, separator = ', ', conj = 'or')
  case elements.size
  when 1
    elements[0]
  when 2
    "#{elements[0]} #{conj} #{elements[1]}"
  else
    init = elements[0...(elements.size - 1)].join(separator)
    "#{init}#{separator}#{conj} #{elements.last}"
  end
end

def output_computer_thinking
  print "Computer is thinking".cyan
  4.times do
    sleep 0.5
    print ".".cyan
  end
end

main
