# Write a method that takes a string, and returns a new string in which
# every character is doubled.

# Examples:

# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''

# ANSWER
# ======
# Problem:
# input:string
# output: string
# rules:
# - new string
# - return string has every character doubled
# - included non alphanumeric characters
# - empty string returns empty string
# Examples:
#  repeater('Hello') == "HHeelllloo"
#  repeater("Good job!") == "GGoooodd  jjoobb!!"
#  repeater('') == ''
# Data structures: perhaps a new array to store characters
#  for return string
# Algorithm:
# - given `string`
# - instantiate `doubled` and set to `''`
# - instantiate `characters` and store every character in `string`
# - for every `character` in `characters`
#    - append in the `character` twice to `doubled`
# - return `doubled`
# Code:

def repeater(string)
  doubled = ''
  characters = string.chars
  size = characters.size
  counter = 0

  while counter < size
    doubled = doubled + string[counter] + string[counter]

    counter += 1
  end

  doubled
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# REFACTOR

def repeater_re(string)
  string.chars.each_with_object('') { |char, str| str << char << char }
end

puts '-- Refactored'
p repeater_re('Hello') == "HHeelllloo"
p repeater_re("Good job!") == "GGoooodd  jjoobb!!"
p repeater_re('') == ''
