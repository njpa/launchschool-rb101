# tictactoe.rb

require 'pry'
require 'colorize'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
GAMES_FOR_WIN = 5

=begin
changes needed for multiboard games
- WINNING_LINES needs to be updated to WINNING_LINES_3X3, and updated throughout
- WINNING_LINES_5X5 needs to be created
- write `prompt_board_size`
- `game_on?` calls `prompt_board_size`
- add `board_size` to `state`
- `board` is empty `{}` in `state`
- update `clear_board` to `create_board` and add `size` argument
- write `board_line_horizontal`, takes `size` as argument
- write `board_line_vertical`, takes `size` as argument
- `board_table` needs to delegate squares out to `board_line_horizontal`
- `board_table` needs to delegate squares out to `board_line_vertical`
- `possible_wins` takes `board_size` as argument
- `possible_wins` uses a `count` with `board_size` to determine possible win
- `can_block?` takes `board_size` as argument
- `can_block?` uses a `count` with `board_size` to determine possible block
- `best_move` defaults to `5` if board_size is `3`,
  defaults to `13` if `board_size` is `5`
=end

def main
  state = {
    score: { player: 0, computer: 0 },
    board: { 1 => INITIAL_MARKER, 2 => INITIAL_MARKER,
             3 => INITIAL_MARKER, 4 => INITIAL_MARKER,
             5 => INITIAL_MARKER, 6 => INITIAL_MARKER,
             7 => INITIAL_MARKER, 8 => INITIAL_MARKER },
    last_winner: :player,
    current_player: :player
  }

  loop do
    break unless game_on?(state)
  end

  puts "Thanks for playing!"
end

def game_on?(state)
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

def place_piece!(board, player)
  case player
  when :player
    player_places_piece!(board)
  else
    output_computer_thinking
    computer_places_piece!(board) if player == :computer
  end
end

def player_places_piece!(board)
  choice = nil

  loop do
    puts "Choose a square (#{joinor(empty_squares(board))}): ".green
    choice = gets.chomp.to_i

    break if empty_squares(board).include? choice

    puts "Please select a valid square!".red
  end

  board[choice] = PLAYER_MARKER
end

def computer_places_piece!(board)
  empty = empty_squares(board)
  best_square = best_move(empty, board)
  board[best_square] = COMPUTER_MARKER
end

def best_move(empty_squares, board)
  possible_wins = possible_wins(empty_squares, board)
  possible_blocks = empty_squares.select { |square| can_block?(square, board) }
  win_starts = empty_squares.select do |square|
    can_start_win?(square, board, 3)
  end

  if !possible_wins.empty?
    possible_wins.sample
  elsif !possible_blocks.empty?
    possible_blocks.sample
  elsif !win_starts.empty?
    win_starts.include?(5) ? 5 : win_starts.sample
  else
    empty_squares.include?(5) ? 5 : empty_squares.sample
  end
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

def can_block?(square, board, board_size = 3)
  blocks = WINNING_LINES.select do |line|
    other_squares = line - [square]
    filled = (0...board_size - 1).all? do |index|
      board[other_squares[index]] == PLAYER_MARKER
    end
    line.include?(square) && filled
  end
  !blocks.empty?
end

def can_start_win?(square, board, board_size)
  wins = WINNING_LINES.select do |line|
    other_squares = line - [square]

    filled_computer = (0...board_size - 1).count do |ind|
      board[other_squares[ind]] == COMPUTER_MARKER
    end

    filled_player = (0...board_size - 1).count do |ind|
      board[other_squares[ind]] == PLAYER_MARKER
    end

    line.include?(square) &&
      (filled_computer == (board_size - 2) && filled_player == 0)
  end
  !wins.empty?
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
  puts score_table(state[:score], state[:current_player]).yellow
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

def score_table(scr, current_player)
  "┌------┬-------┬--------┬---------┐\n" \
  "|      | SCORE | MARKER | CURRENT |\n"\
  "├------+-------+--------+---------┤\n" \
  "| You  |   #{scr[:player]}   |   #{PLAYER_MARKER}    |" \
  "    #{current_player == :player ? '*' : ' '}    |\n"\
  "| Me   |   #{scr[:computer]}   |   #{COMPUTER_MARKER}    |" \
  "    #{current_player == :computer ? '*' : ' '}    |\n"\
  "└------┴-------┴--------┴---------┘\n"
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
  print "I'm thinking".cyan
  4.times do
    sleep 0.5
    print ".".cyan
  end
end

main
