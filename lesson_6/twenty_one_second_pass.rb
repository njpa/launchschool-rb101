require 'colorize'

ROUNDS_PER_GAME = 5
FACE_VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
FACES = %w(clubs diamonds hearts spades)

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

def deal_card!(deck, recipient)
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
  puts "                            |___/                         \n".blue
end

def display_scoreboard(score_dealer, score_player)
  puts "┌------------┐".green
  puts "| SCOREBOARD |".green
  puts "├------------┤".green
  puts "| DEALER:  #{score_dealer} |".green
  puts "| PLAYER:  #{score_player} |".green
  puts "└------------┘\n".green
end

def display_total(total)
  puts "total: #{total}\n".light_black
end

def display_as_hidden
  puts "[########]".red
end

def display_card(card)
  puts "#{card[:face_value]} of #{card[:face]}".red
end

def display_player(cards, total)
  puts "PLAYER".cyan
  puts "======\n".cyan

  cards.each { |card| display_card(card) }
  display_total(total)
end

def display_dealer(cards, total, show_hidden_card)
  puts "DEALER".cyan
  puts "======\n".cyan

  first_card, *other_cards = cards
  show_hidden_card ? display_card(first_card) : display_as_hidden
  other_cards.each { |card| display_card(card) }

  show_hidden_card ? display_total(total) : puts
end

def display(state, show_card=false)
  system("clear") || system("cls")
  display_header
  display_scoreboard(state[:score_dealer], state[:score_player])
  display_dealer(state[:dealers_cards], state[:dealer_total], show_card)
  display_player(state[:players_cards], state[:player_total])
  puts "________________________".light_black
  puts
end

def output_round_winner(dealer_total, player_total)
  case dealer_total <=> player_total
  when -1 then puts "Player wins round!".green
  when 1  then puts "Dealer wins round!".green
  else         puts "It's a tie!".green
  end
  puts
end

def output_game_winner(score_dealer, score_player)
  case score_dealer <=> score_player
  when 1  then puts "DEALER WINS GAME!".green
  when -1 then puts "PLAYER WINS GAME!".green
  end
end

def output_status(message)
  print message.light_black
  5.times do
    print ".".light_black
    sleep(0.5)
  end
end

def another_game?
  answer = ""
  loop do
    puts "Would you like to play another game? ('y'/'n')"
    answer = gets.chomp.downcase

    break if %w(y n yes no).include?(answer)

    puts "Sorry, that's not a valid answer."
  end

  ["y", "yes"].include?(answer)
end

def hit?
  answer = ""
  loop do
    puts "Would you like to (h)it or (s)tay?"
    answer = gets.chomp.downcase

    break if %w(hit h stay s).include?(answer)

    puts "Sorry, that's not a valid answer."
  end
  ["h", "hit"].include?(answer)
end

def bust?(hand)
  total(hand) > 21
end

def number_aces(cards)
  cards.select { |card| card[:face_value] == "Ace" }.size
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

def player_stays?(state)
  loop do
    return false if bust?(state[:players_cards])
    return true unless hit?

    deal_card!(state[:deck], state[:players_cards])
    update_totals!(state)
    display(state)
  end
end

def dealer_stays?(state)
  loop do
    if state[:dealer_total] < 17
      output_status("Dealer asks for hit")
      deal_card!(state[:deck], state[:dealers_cards])
      update_totals!(state)
    else
      return false if bust?(state[:dealers_cards])

      output_status("Dealer stays")
      return true
    end

    display(state, true)
  end
end

def process_dealer_bust!(state)
  state[:score_player] += 1
  display(state, true)
  puts "Dealer busts! Player wins round!".green
end

def process_player_bust!(state)
  state[:score_dealer] += 1
  display(state, true)
  puts "Player busts! Dealer wins round!".green
end

def process_round_win!(state)
  case state[:dealer_total] <=> state[:player_total]
  when -1 then state[:score_player] += 1
  when 1  then state[:score_dealer] += 1
  end

  display(state, true)
  output_round_winner(state[:dealer_total], state[:player_total])
end

def update_totals!(state)
  state[:dealer_total] = total(state[:dealers_cards])
  state[:player_total] = total(state[:players_cards])
end

def play_round(state)
  display(state)

  if player_stays?(state)
    display(state, true)
    output_status("Player stays")
    dealer_stays = dealer_stays?(state)
    display(state, true)

    dealer_stays ? process_round_win!(state) : process_dealer_bust!(state)
  else
    process_player_bust!(state)
  end
end

def setup_round(state)
  state[:deck] = initialize_deck
  state[:players_cards] = []
  state[:dealers_cards] = []
  state[:dealer_total] = 0
  state[:player_total] = 0
  2.times { deal_card!(state[:deck], state[:players_cards]) }
  2.times { deal_card!(state[:deck], state[:dealers_cards]) }
  update_totals!(state)

  play_round(state)
end

def play_game(state)
  loop do
    setup_round(state)

    break if state[:score_dealer] == ROUNDS_PER_GAME ||
             state[:score_player] == ROUNDS_PER_GAME

    output_status("Setting up next round")
  end
end

def main
  loop do
    game_state = { deck: [],
                   players_cards: [],
                   dealers_cards: [],
                   dealer_total: 0,
                   player_total: 0,
                   score_dealer: 0,
                   score_player: 0 }

    play_game(game_state)

    output_game_winner(game_state[:score_dealer], game_state[:score_player])
    break unless another_game?
  end

  puts "Thanks for playing Twenty-one!"
end

main
