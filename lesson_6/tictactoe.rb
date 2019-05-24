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
  last_winner = new_game(state)

  display(state)

  case last_winner
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

def new_game(state)
  clear_board(state[:board])

  second_player = state[:last_winner] == :player ? :computer : :player

  loop do
    break if end_play?(state, state[:last_winner])

    break if end_play?(state, second_player)
  end

  if win?(state[:board], COMPUTER_MARKER)
    state[:last_winner] = :computer
    increase_score(state[:score], :computer)
    :computer
  elsif win?(state[:board], PLAYER_MARKER)
    state[:last_winner] = :player
    increase_score(state[:score], :player)
    :player
  end
end

def increase_score(score, player)
  score[player] += 1
end

def end_play?(state, current_turn)
  game_over = false
  display(state)
  if current_turn == :player
    player_places_piece!(state[:board])
    game_over = true if win?(state[:board], PLAYER_MARKER)
  else
    output_computer_thinking
    computer_places_piece!(state[:board])
    game_over = true if win?(state[:board], COMPUTER_MARKER)
  end
  display(state)
  game_over = true if board_full?(state[:board])
  game_over
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

def computer_places_piece!(board)
  empty = empty_squares(board)

  wins = empty.select { |square| can_win?(square, board) }
  blocks = empty.select { |square| can_block?(square, board) }
  win_starts = empty.select { |square| can_start_win?(square, board) }

  choice =
    if !wins.empty?
      wins.sample
    elsif !blocks.empty?
      blocks.sample
    elsif !win_starts.empty? && win_starts.include?(5)
      5
    elsif !win_starts.empty?
      win_starts.sample
    elsif empty.include?(5)
      5
    else
      empty.sample
    end

  board[choice] = COMPUTER_MARKER
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

def can_win?(square, board)
  wins = WINNING_LINES.select do |line|
    other_squares = line - [square]
    line.include?(square) &&
      board[other_squares[0]] == COMPUTER_MARKER &&
      board[other_squares[1]] == COMPUTER_MARKER
  end
  !wins.empty?
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

def win?(board, player)
  win = WINNING_LINES.select do |line|
    (line - board.keys.select { |pos| board[pos] == player }) == []
  end
  !win.empty?
end

def empty_squares(board)
  board.keys.select { |pos| board[pos] == INITIAL_MARKER }
end

def clear_board(board)
  (1..9).each { |key| board[key] = INITIAL_MARKER }
end

def board_full?(board)
  empty_squares(board).empty?
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

def output_computer_thinking
  print "Computer is thinking".cyan
  2.times do
    sleep 1.1
    print ".".cyan
  end
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

main
