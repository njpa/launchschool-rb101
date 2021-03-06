# tictactoe.rb

require 'colorize'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
ROUNDS_FOR_WIN = 5

def main
  state = {
    board: {},
    board_size: 3,
    score: { player: 0, computer: 0 },
    last_winner: :player,
    current_player: :player,
    winning_lines: winning_lines(3)
  }

  loop do
    initialize_round(state)
    winner = play_round(state)
    output_winner_message(winner)

    break if enough_rounds_won?(state[:score]) || !prompt_play_again?
  end
end

def initialize_round(state)
  state[:board_size] = prompt_board_size
  state[:winning_lines] = winning_lines(state[:board_size])
end

def play_round(state)
  create_board!(state)

  winner = nil

  loop do
    display(state)
    winner = play_turn!(state)
    break if winner || board_full?(state[:board])

    alternate_player!(state)
  end

  winner
end

def enough_rounds_won?(score)
  score[:player] >= ROUNDS_FOR_WIN || score[:computer] >= ROUNDS_FOR_WIN
end

def play_turn!(state)
  place_piece!(state[:board], state[:current_player], state[:board_size],
               state[:winning_lines])

  a_win = nil

  if a_winner?(state[:board], state[:winning_lines])
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

def place_piece!(board, player, board_size, winning_lines)
  case player
  when :player
    player_places_piece!(board)
  else
    output_computer_thinking
    if player == :computer
      computer_places_piece!(board, board_size, winning_lines)
    end
  end
end

def player_places_piece!(board)
  choice = nil

  loop do
    puts "Choose a square (#{joinor(empty_squares(board))}): ".green
    choice = gets.chomp

    break if valid_int(choice) && empty_squares(board).include?(choice.to_i)

    puts "Please select a valid square!".red
  end

  board[choice.to_i] = PLAYER_MARKER
end

def computer_places_piece!(board, board_size, winning_lines)
  empty_squares = empty_squares(board)
  possible = possibilities(empty_squares, board, board_size, winning_lines)
  best_square = best_move(possible, empty_squares)
  board[best_square] = COMPUTER_MARKER
end

def best_move(possible, empty_squares)
  wins = possible[:wins]
  blocks = possible[:blocks]
  runs = possible[:runs]
  mid = possible[:mid]

  if wins.any?
    wins.sample
  elsif blocks.any?
    blocks.sample
  elsif runs.include?([:mid])
    mid
  elsif runs.any?
    runs.sample
  else
    empty_squares.include?(mid) ? mid : empty_squares.sample
  end
end

def possibilities(empty_squares, board, board_size, winning_lines)
  { wins: possible_wins(empty_squares, board, board_size, winning_lines),
    blocks: possible_blocks(empty_squares, board, board_size, winning_lines),
    runs: possible_runs(empty_squares, board, board_size, winning_lines),
    mid: mid_board(board_size),
    random: empty_squares.sample }
end

def mid_board(board_size)
  ((board_size * board_size) / 2) + 1
end

def possible_wins(empty_squares, board, board_size, winning_lines)
  empty_squares.reject do |square|
    wins = winning_lines.select do |line|
      other_squares = line - [square]
      filled_computer = filled_in_by(COMPUTER_MARKER, board, board_size,
                                     other_squares)
      line.include?(square) && filled_computer == (board_size - 1)
    end
    wins.empty?
  end
end

def possible_blocks(empty_squares, board, board_size, winning_lines)
  empty_squares.reject do |square|
    blocks = winning_lines.select do |line|
      other_squares = line - [square]
      filled = filled_in_by(PLAYER_MARKER, board, board_size, other_squares)
      line.include?(square) && filled == (board_size - 1)
    end
    blocks.empty?
  end
end

def possible_runs(empty_squares, board, board_size, winning_lines)
  empty_squares.reject do |square|
    wins = winning_lines.select do |line|
      other_squares = line - [square]
      filled_computer = filled_in_by(COMPUTER_MARKER, board, board_size,
                                     other_squares)
      filled_player = filled_in_by(PLAYER_MARKER, board, board_size,
                                   other_squares)
      line.include?(square) &&
        (filled_computer >= 1 && filled_player == 0)
    end
    wins.empty?
  end
end

def filled_in_by(player_marker, board, board_size, squares_to_test)
  (0...board_size - 1).count do |ind|
    board[squares_to_test[ind]] == player_marker
  end
end

def a_winner?(board, winning_lines)
  winner = false
  [COMPUTER_MARKER, PLAYER_MARKER].each do |player|
    winning_lines.select do |line|
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

def create_board!(state)
  state[:board] = Hash.new
  squares = state[:board_size] * state[:board_size]
  (1..squares).each { |key| state[:board][key] = INITIAL_MARKER }
end

def display(state)
  clear_output_screen

  puts score_table(state[:score], state[:current_player]).yellow
  puts ''
  puts board_table(state[:board], state[:board_size])
  puts ''
end

def prompt_play_again?
  puts "Do you want to play again (y/n)?: "
  again = ''

  loop do
    again = gets.chomp
    break if %w(Y N y n).include? again

    puts "Please enter 'y' or 'n': "
  end

  again.downcase == 'y'
end

def prompt_board_size
  puts "What board size would you like to play in? (3, 5, 7, 9, etc): "
  size = ''

  loop do
    size = gets.chomp.to_i
    break if size.odd? && size >= 3

    puts "Please enter an odd number greater than or equal to 3: "
  end

  size
end

def board_table(brd, size)
  board = ""
  size.times do |index|
    board += board_line_vertical_numbered(size, index)
    board += board_line_markers(brd, size, index)
    board += board_line_vertical(size)
    board += board_line_horizontal(size) if index < (size - 1)
  end
  board
end

def board_line_markers(board, size, row)
  line = ""
  size.times do |index|
    marker = board[(row * size) + (index + 1)].red
    line << "  #{marker}  |"
  end
  line.chop << "\n"
end

def board_line_horizontal(size)
  ("-----+" * size).chop << "\n"
end

def board_line_vertical_numbered(size, row)
  line = ""
  size.times do |index|
    number = ((row * size) + (index + 1)).to_s.rjust(3, ' ')
    line << "#{number}  |"
  end
  line.chop.cyan << "\n"
end

def board_line_vertical(size)
  ("     |" * size).chop << "\n"
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

def valid_int(str)
  str == str.to_i.to_s
end

def output_introduction
  clear_output_screen

  puts "Welcome to Tic Tac Toe, the first one to win #{ROUNDS_FOR_WIN} " \
       "round(s) wins the tournament!"
end

def output_computer_thinking
  print "I'm thinking".cyan
  3.times do
    sleep 0.5
    print ".".cyan
  end
end

def output_winner_message(winner)
  case winner
  when :player   then puts "Nice!"
  when :computer then puts "Good try! Better luck next time."
  else                puts "Looks like it's a tie!"
  end
end

def output_goodbye
  puts "Thanks for playing tic tac toe with me!"
end

def clear_output_screen
  system('clear') || system('cls')
end

def winning_lines(board_size)
  winning_lines = []
  winning_lines += winning_horizontal_lines(board_size)
  winning_lines += winning_vertical_lines(board_size)
  winning_lines << winning_forward_diagonal(board_size)
  winning_lines << winning_backward_diagonal(board_size)
  winning_lines
end

def winning_horizontal_lines(board_size)
  winning_lines = []
  line_count = 0

  until line_count >= board_size
    line = []
    starting_element = (line_count * board_size) + 1
    board_size.times { |ind| line.push(starting_element + ind) }
    winning_lines.push(line)

    line_count += 1
  end

  winning_lines
end

def winning_vertical_lines(board_size)
  winning_lines = []
  line_count = 1

  until line_count > board_size
    line = []
    starting_element = line_count
    board_size.times { |ind| line.push(starting_element + (ind * board_size)) }
    winning_lines.push(line)

    line_count += 1
  end

  winning_lines
end

def winning_forward_diagonal(board_size)
  forward_diagonal = []
  count = 1

  while count <= (board_size * board_size)
    forward_diagonal.push(count)
    count += (board_size + 1)
  end

  forward_diagonal
end

def winning_backward_diagonal(board_size)
  backward_diagonal = []
  count = board_size

  while count < (board_size * board_size)
    backward_diagonal.push(count)
    count += (board_size - 1)
  end

  backward_diagonal
end

output_introduction

main

output_goodbye
