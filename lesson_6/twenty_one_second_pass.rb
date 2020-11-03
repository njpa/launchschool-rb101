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

def display_player(players_cards)
  puts "**********".cyan
  puts "* PLAYER *".cyan
  puts "**********".cyan
  puts
  players_cards.each do |card|
    puts "#{card[:face_value]} of #{card[:face]}".red
  end
end

def display_dealer(dealers_cards)
  puts "**********".cyan
  puts "* DEALER *".cyan
  puts "**********".cyan
  puts
  dealers_cards.each do |card|
    puts "#{card[:face_value]} of #{card[:face]}".red
  end
end

def display(dealers_cards, players_cards)
  system("clear") || system("cls")
  display_player(players_cards)
  puts
  display_dealer(dealers_cards)
  puts
  puts "________________________".light_black
  puts
end

def prompt_action
  answer = ""
  loop do
    puts "Hit or stay? ('hit'/'stay')"
    answer = gets.chomp.downcase

    break if ["hit", "stay"].include?(answer)
  end
  answer == "hit" ? :hit : :stay
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

def player_turn(deck, dealers_cards, players_cards)
  result = :stay
  loop do
    if bust?(players_cards)
      result = :bust
      break
    end

    if prompt_action == :hit
      deal!(deck, players_cards)
    else
      break
    end

    display(dealers_cards, players_cards)
  end
  result
end

def output_status(message)
  puts message.light_black
  sleep(2)
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

    display(dealers_cards, players_cards)
  end
  result
end

def output_winner(dealer_total, player_total)
  case dealer_total <=> player_total
  when -1 then puts "PLAYER WINS!".green
  when 1  then puts "DEALER WINS!".green
  else         puts "IT'S A TIE!".green
  end
  puts
end

def game(deck, players_cards, dealers_cards)
  display(dealers_cards, players_cards)
  player_result = player_turn(deck, dealers_cards, players_cards)

  if player_result == :bust
    puts "PLAYER BUSTS!".green
  else
    output_status("Player stays...")
    dealer_result = dealer_turn(deck, dealers_cards, players_cards)
    display(dealers_cards, players_cards)

    if dealer_result == :bust
      puts "DEALER BUSTS!".green
    else
      output_winner(total(dealers_cards), total(players_cards))
    end
  end
end

def main
  deck = initialize_deck
  players_cards = []
  dealers_cards = []
  2.times { deal!(deck, players_cards) }
  2.times { deal!(deck, dealers_cards) }
  game(deck, players_cards, dealers_cards)
end

main

=begin test for bust method
hand = [
        {face: "spades", face_value: "8", value: 8},
        #{face: "spades", face_value: "Queen", value: 10},
        {face: "clubs", face_value: "Ace", value: [1, 11]},
        {face: "hearts", face_value: "2", value: 2},
        {face: "diamonds", face_value: "Ace", value: [1, 11]}
        #{face: "diamonds", face_value: "King", value: 10}
       ]
p bust?(hand)
=end
=begin
DATA STRUCTURES
===============
`deck`:  A list of 52 hashes containing the keys:
      'face', 'face_value', 'value',
  For example:
  [{face: 'spades', face_value': 'queen', value: 10},
   {face: 'clubs', face_value': 'ace', value: [1, 11]},
   {face: 'hearts', face_value': '4', value: 4},
   {face: 'diamonds', face_value': 'king', value: 10},
   ...
  ]
  Reasoning:
  - we have to be able to tell the value
  - the face value and the face is needed
  - we have to pull cards randomly from this deck,
    we need to differentiate between cards that have been handed out,
`players_cards`:  an empty list, waiting to be populated with cards from
                  the `deck` list
`dealers_cards`:  an empty list, waiting to be populated with cards from
                  the `deck` list
=end
