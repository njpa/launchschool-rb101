require 'pry-byebug'
require 'colorize'

FACES = %w(clubs diamonds hearts spades)
FACE_VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

def initialize_deck
  deck = []
  FACES.each do |face|
    FACE_VALUES.each do |face_value|
      value = face_value.to_i.to_s == face_value ? face_value.to_i : 10
      value = [1, 11] if face_value == "Ace"
      deck << { face: face, face_value: face_value, value: value }
    end
  end
  deck
end

def deal!(deck, recipient)
  return nil if deck.empty?
  random_card = deck.sample
  random_card_index = deck.index(random_card)
  deck.delete_at(random_card_index)
  recipient << random_card
end

def display_header
  puts " _                      _".blue
  puts "| |___      _____ _ __ | |_ _   _        ___  _ __   ___  ".blue
  puts "| __\\ \\ /\\ / / _ \\ '_ \\| __| | | |_____ / _ \\| '_ \\ / _ \\ ".blue
  puts "| |_ \\ V  V /  __/ | | | |_| |_| |_____| (_) | | | |  __/ ".blue
  puts " \\__| \\_/\\_/ \\___|_| |_|\\__|\\__, |      \\___/|_| |_|\\___| ".blue
  puts "                            |___/                         ".blue
end

def display_player(cards)
  puts "****************".cyan
  puts "* PLAYER  (#{total(cards)}) *".cyan
  puts "****************".cyan
  puts
  cards.each do |card|
    puts "#{card[:face_value]} of #{card[:face]}".red
  end
end

def display_dealer_header(cards, show_hidden_card)
  if show_hidden_card
    puts "***************".cyan
    puts "* DEALER (#{total(cards)}) *".cyan
    puts "***************".cyan
  else
    puts "**********".cyan
    puts "* DEALER *".cyan
    puts "**********".cyan
  end
end

def display_dealer(cards, show_hidden_card)
  display_dealer_header(cards, show_hidden_card)
  puts
  cards.each_with_index do |card, idx|
    if idx == 0 && !show_hidden_card
      puts "[hidden card]".red
    else
      puts "#{card[:face_value]} of #{card[:face]}".red
    end
  end
end

def display(dealers_cards, players_cards, show_dealer_card=false)
  system("clear") || system("cls")
  display_header
  puts
  display_player(players_cards)
  puts
  display_dealer(dealers_cards, show_dealer_card)
  puts
  puts "________________________".light_black
  puts
end

def output_winner(dealer_total, player_total)
  case dealer_total <=> player_total
  when -1 then puts "PLAYER WINS!".green
  when 1  then puts "DEALER WINS!".green
  else         puts "IT'S A TIE!".green
  end
  puts
end

def output_status(message)
  puts message.light_black
  sleep(2)
end

def hit?
  answer = ""
  loop do
    puts "Would you like to (h)it or (s)tay?"
    answer = gets.chomp.downcase

    break if ["h", "s"].include?(answer)
  end
  answer == "h"
end

def total(hand)
  sum = 0
  hand.each do |card|
    value = card[:face_value] == "Ace" ? 11 : card[:value]
    sum += value
  end

  number_aces(hand).times { sum -= 10 if sum > 21 }
  sum
end

def bust?(hand)
  total(hand) > 21
end

def number_aces(cards)
  cards.select { |card| card[:face_value] == "Ace" }.size
end

def player_stays?(deck, dealers_cards, players_cards)
  loop do
    return false if bust?(players_cards)

    if hit?
      deal!(deck, players_cards)
    else
      return true
    end

    display(dealers_cards, players_cards)
  end
end

def dealer_turn(deck, dealers_cards, players_cards)
  result = :stay
  loop do
    if total(dealers_cards) < 17
      output_status("Dealer asks for hit...")
      deal!(deck, dealers_cards)
    else
      result = :bust if bust?(dealers_cards)
      output_status("Dealer stays...") unless bust?(dealers_cards)
      break
    end

    display(dealers_cards, players_cards, true)
  end
  result
end

def turns(deck, players_cards, dealers_cards, dealer_total, player_total)
  display(dealers_cards, players_cards)

  if player_stays?(deck, dealers_cards, players_cards)
    display(dealers_cards, players_cards, true)
    output_status("Player stays...")
    display(dealers_cards, players_cards, true)

    dealer_result = dealer_turn(deck, dealers_cards, players_cards)
    display(dealers_cards, players_cards, true)

    if dealer_result == :bust
      puts "DEALER BUSTS!".green
    else
      output_winner(total(dealers_cards), total(players_cards))
    end
  else
    puts "PLAYER BUSTS!".green
  end
end

def play_game
  deck = initialize_deck
  players_cards = []
  dealers_cards = []
  dealer_total = 0
  player_total = 0
  2.times { deal!(deck, players_cards) }
  2.times { deal!(deck, dealers_cards) }
  turns(deck, players_cards, dealers_cards, dealer_total, player_total)
end

def another_game?
  answer = ""

  loop do
    puts "Would you like to play another game? ('y'/'n')"
    answer = gets.chomp.downcase
    break if ["n", "y"].include?(answer)
    puts "Please enter 'y' or 'n':"
  end

  answer == "y"
end

def main
  loop do
    play_game
    break unless another_game?
  end
  puts "Thanks for playing Twenty-one!"
end

main
