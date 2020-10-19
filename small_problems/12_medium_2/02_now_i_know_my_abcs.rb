=begin
Now I Know My ABCs
A collection of spelling blocks has two letters per block, as shown in this list:

Copy Code
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples:
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

start: 13:41/13:49/14:04

data structures: multidimensional array, with each array containing the first character
 and the second character as elements, example [['B', 'O'], ['G', 'T'], ... ]

ALGO
-===
- given `word`
- given `blocks`, set to a multidimensional array ([['B', 'O'], ['G', 'T'], ... ])
- instantiate `letters` and save characters of `word`
- instantiate `possible` to `true`
- for each `letter` in `letters`
-   if `letter` is an element of any of the `sub_array` elements in `blocks`
-     remove that sub-array from `blocks`
-   else
-     return `false`
- return `possible`

=end

def block_word?(word)
  blocks = blocks()
  possible = true
  word.chars.each do |letter|
    if blocks.any? { |block| same(letter, block[0]) || same(letter, block[1]) }
      index = blocks.index do |block|
          same(letter, block[0]) || same(letter, block[1])
        end
      blocks.delete_at(index)
    else
      return false
    end
  end
  possible
end

def blocks
  [%w(B O), %w(X K), %w(D Q), %w(C P), %w(N A), %w(G T), %w(R E),
   %w(F S), %w(J W), %w(H U), %w(V I), %w(L Y), %w(Z M)]
end

def same(charA, charB)
  charA.downcase == charB.downcase
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('josé') == false
