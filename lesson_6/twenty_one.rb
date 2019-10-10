# 11:52 - 12:21 (29 mins)
# 12:27 - 12:55 (28 mins)
# 12:59 - 13:15 (16 mins)
# 13:24 - 13:32 ( 6 mins)
# 1 hour 19 mins

=begin

data structure options:

hash with the following keys:
  - suit: [diamonds | spades | hearts | clubs]
  - type: [ number | jack | queen | king | ace ]
  - number: (optional) integer
  - game_value: integer
  example:
  [ { suit: 'diamond', type: 'jack', number: nil,
      game_value: 10},
    { suit: 'club', type: 'number', number: 2,
      game_value: 2},
    { suit: 'spade', type: 'ace', number: nil,
      game_value: 1},
    {
  ]

array:
%w(2 3 4 5 6 7 8 9 jack queen king ace) * 4
The program would deal with the card value using a method:
  If string argument is a number, value is equal to number
  If argument == 'ace', 1 or 11
  Else, 10

N.B.: The program already has to deal with the exception to the
rule of 'ace' not being worth a single value (1 or 11).  This
makes it less attractive for us to have a complex data structure
which attempts to meet all requirements.  I am therefore opting
for a simple data structure and relying on the program's logic
to obtain the card value.

The problem example opts for a nested array, with each
element being a 2-element array containing the suit and number of the
card.  It also opts for using strings rather than numbers for the
card number.  For example:

[['H', '2'], ['C', 'J']]

Method to calculate ace value
------------------------------
Assuming that our data structure is as defined by the example...
input: 2 cards (arrays with 'suit' and 'value')
output: integer
rules:
- if both cards have values different from 'ace'
  return sum of values using the method below to deduce their value
- if one card has a value of 'ace'
  if value of other card + 11 is less than 21, then return the sum
  else, return value of other card + 1
- if both cards have a value of 'ace', return 12

method to deduce value of card:
- if card value can be converted to integer, then return integer
- else return 10

=end

def total(cards)
  cards = cards.map { |card| card[1] }
  total = cards.map { |card| card_game_value(card) }.sum

  cards.select { |card| card == 'A'}.each do |_|
    total -= 10 if total > 21
  end

  total
end

def card_game_value(card)
  if card.to_i.to_s == card
    card.to_i
  elsif %w(J Q K).include? card
    10
  else
    11
  end
end

=begin
p card_game_value('Q') == 10
p card_game_value('J') == 10
p card_game_value('K') == 10
p card_game_value('2') == 2
p card_game_value('9') == 9
=end

p total([['C', 'A'], ['H', '2']]) == 13
p total([['C', 'A'], ['H', '9']]) == 20
p total([['C', 'K'], ['H', '9']]) == 19
p total([['C', 'K'], ['H', '9'], ['S', '2']]) == 21
p total([['C', 'K'], ['H', '9'], ['D', 'A']]) == 20
p total([['C', 'K'], ['C', 'A'], ['D', 'A']]) == 12
