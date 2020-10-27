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

def display_board(board, wins_player, wins_computer)
  system("clear") || system("cls")
  puts "=============="
  puts "| SCOREBOARD"
  puts "| PLAYER: #{wins_player}"
  puts "| COMPUTER: #{wins_computer}"
  puts "=============="
  puts
  puts "   |   |  "
  puts " #{board[1]} | #{board[2]} | #{board[3]} "
  puts "   |   |  "
  puts "---+---+---"
  puts "   |   |  "
  puts " #{board[4]} | #{board[5]} | #{board[6]} "
  puts "   |   |  "
  puts "---+---+---"
  puts "   |   |  "
  puts " #{board[7]} | #{board[8]} | #{board[9]} "
  puts "   |   |  "
end

def empty_squares(board)
  board.select { |square, value| value == MARKING_EMPTY }.keys
end

def make_move(board, square, player_marker)
  board[square] = player_marker
end

def board_full?(board)
  board.none? { |square, marking| marking == MARKING_EMPTY }
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
  return "#{numbers[0]} and #{numbers[1]}" if numbers.size == 2
  numbers[0..-2].join(', ') << " and #{numbers[-1]}"
end

def prompt_square(empty_squares)
  square = 0
  loop do
    puts "Please select a box (#{joinor(empty_squares)}): "
    square = gets.chomp.to_i
    break if empty_squares.include?(square)
    puts "Sorry, that's not a valid square!"
  end
  square
end

def play_game(board, wins_player, wins_computer)
  display_board(board, wins_player, wins_computer)

  loop do
    square = prompt_square(empty_squares(board))
    make_move(board, square, MARKING_PLAYER)
    display_board(board, wins_player, wins_computer)

    if win?(board, MARKING_PLAYER)
      puts "Congratulations, you won!"
      wins_player += 1
      break
    elsif board_full?(board)
      puts "It's a tie!"
      break
    end

    puts "Computer making move..."
    sleep(1)
    square = empty_squares(board).sample
    make_move(board, square, MARKING_COMPUTER)
    display_board(board, wins_player, wins_computer)

    if win?(board, MARKING_COMPUTER)
      puts "Sorry, the computer won!"
      wins_computer += 1
      break
    elsif board_full?(board)
      puts "It's a tie!"
      break
    end
  end
  {wins_player: wins_player, wins_computer: wins_computer}
end

def prompt_game
  wins_player = 0
  wins_computer = 0
  loop do
    board = build_board()
    results = play_game(board, wins_player, wins_computer)
    wins_player = results[:wins_player]
    wins_computer = results[:wins_computer]

    if wins_player == GAMES_PER_MATCH
      puts "Congratulations, you won the set at #{wins_player}/#{wins_computer}!"
      break
    elsif wins_computer == GAMES_PER_MATCH
      puts "Sorry, you lost the set at #{wins_player}/#{wins_computer}"
      break
    else
      puts "preparing a new game..."
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
