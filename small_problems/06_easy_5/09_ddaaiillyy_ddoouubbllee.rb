# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. You may not use
# `String#squeeze` or `String#squeeze!`.
#
# Examples:
#
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''
#
# ANSWER
# ======
# input: string
# output: string
# rules:
# - return string has consecutive duplicate characters collapsed into
#   single character
# - empty string returns empty string
# - cannot use `#squeeze` or `#squeeze!`
# - returns new string, not mutated string
# EXAMPLES
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''
# DATA STRUCTURES
# - Array to store characters for comparison
# ALGORITHM
# - given `str`
# - split into characters and store in `characters`
# - instantiate `collapsed` and set to `[]`
# - instantiate `last_character` and set to `''`
# - for each `character` in `characters`
#   - unless `character` is equal to `last_character`
#     set `last_character` to `character`
#     push `character` into `collapsed`
# - join `collapsed` into a string and return
# CODE

def crunch(str)
  last_character = ''
  collapsed = str.chars.each_with_object([]) do |character, arr|
    unless character == last_character
      arr.push(character)
      last_character = character
    end
  end
  collapsed.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
