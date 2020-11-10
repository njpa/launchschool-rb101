require 'pry-byebug'
=begin
Card Deck
We started working on a card game but got stuck. Check out why the code below
raises a TypeError.
Once you get the program to run and produce a sum, you might notice that the
sum is off: It's lower than it should be. Why is that?
=end

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup,
         :diamonds => cards.dup,
         :clubs    => cards.dup,
         :spades   => cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  #suit_cards =
    remaining_cards.map! do |card|
      score(card)
    end

  #sum += suit_cards.sum #remaining_cards.sum
  sum += remaining_cards.sum
end

binding.pry
puts sum

# ANSWER
# ======
# The `deck` hash uses the same `cards` object to populate each of its four
# suits.  When the code takes a card from each of the suits in the `deck`
# hash to populate the `player_cards`, it is simultaneously removing an element
# from the same `cards` object every time.
# We can work around this issue by cloning the `cards` object when it is
# assigned as the value of each suit in the `deck` hash object.

# When the code determines the score of the remaining cards, it first attempts
# to create an array of only values for each suit and then accumulates
# it to the `sum` variable in each iteration.  However, the resulting
# array of values-only for each suit is not used in the accumulation.  Instead
# the block argument `remaining_cards` is used.  In trying to reduce this array
# of mixed types, Ruby throws a TypeError because it cannot invoke the
# `Integer#+` method on a symbol.

