# tictactoe.rb

require 'pry'
require 'colorize'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'x'
COMPUTER_MARKER = 'o'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
                 [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
GAMES_FOR_WIN = 3

def main
  state = {
    score: { player: 0, computer: 0 },
    board: { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ',
             5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ' },
    last_winner: :computer,
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

  case last_winner
  when :player
    display(state)
    puts "Nice!"

  when :computer
    display(state)
    puts "Good try! Better luck next time."
  else
    puts "Looks like it's a tie!"
  end

  if state[:score][:player] >= GAMES_FOR_WIN ||
     state[:score][:computer] >= GAMES_FOR_WIN
    false
  else
    !(prompt_again == 'n')
  end
end

def new_game(state)
  clear_board(state[:board])
  second_player = state[:last_winner] == :player ? :computer : :player

  loop do
    game_over = make_play(state, state[:last_winner])
    break if game_over

    game_over = make_play(state, second_player)
    break if game_over
  end

  if win?(state[:board], COMPUTER_MARKER)
    state[:last_winner] = :computer
    state[:score][:computer] += 1
    :computer
  elsif win?(state[:board], PLAYER_MARKER)
    state[:last_winner] = :player
    state[:score][:player] += 1
    :player
  end
end

def make_play(state, current_turn)
  game_over = false
  display(state)
  if current_turn == :player
    player_places_piece!(state[:board])
    game_over = true if win?(state[:board], PLAYER_MARKER)
  else
    computer_places_piece!(state[:board])
    game_over = true if win?(state[:board], COMPUTER_MARKER)
  end
  game_over = true if board_full?(state[:board])
  display(state)
  game_over
end

def player_places_piece!(board)
  choice = nil

  loop do
    puts "Choose a square (#{empty_squares(board).join(', ')}): ".green
    choice = gets.chomp.to_i

    break if empty_squares(board).include? choice

    puts "warning: Please select a valid square!".red
  end

  board[choice] = PLAYER_MARKER
  board
end

def computer_places_piece!(board)
  output_computer_thinking
  choice = empty_squares(board).sample
  board[choice] = COMPUTER_MARKER
  board
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
  "┌-----------------┐\n" \
  "| MRKR     SCORE      |\n"\
  "├------┬-----------┤\n" \
  "| [#{PLAYER_MARKER}] | You:      #{scr[:player]} |\n"\
  "| [#{COMPUTER_MARKER}] | Computer: #{scr[:computer]} |\n"\
  "└------┴-----------┘\n"
end

def output_computer_thinking
  print "Computer is thinking".cyan
  2.times do
    sleep 1.1
    print ".".cyan
  end
end

def clear_board(board)
  (1..9).each { |key| board[key] = INITIAL_MARKER }
end

def board_full?(board)
  empty_squares(board).empty?
end

def empty_squares(board)
  board.keys.select { |pos| board[pos] == INITIAL_MARKER }
end

def win?(board, player)
  win = WINNING_LINES.select do |line|
    (line - board.keys.select { |pos| board[pos] == player }) == []
  end
  !win.empty?
end

main
