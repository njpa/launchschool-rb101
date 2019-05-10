# Write a method that takes a String as an argument, and returns a new
# String that contains the original value using a staggered capitalization
# scheme in which every other character is capitalized, and the remaining
# characters are lowercase. Characters that are not letters should not be
# changed, but count as characters when switching between upper and
# lowercase.

# Example:

# staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# staggered_case('ALL_CAPS') == 'AlL_CaPs'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# ANSWER
# in: string
# out: string
# rules:
#  - new string returned
#  - return string will have every other character capitalized,
#    with remaining characters in lowercase
#  - non-alphabetic characters remain unchanged, but still count as
#    characters nonetheless
#  - capitalization starts on first character
# data structures:
#  - temporary arrays to hold characters
# algorithm:
#  - given `string`
#  - instantiate `result` and set to `''`
#  - split `string` into characters and store in `characters`
#  - iterate through every `character` in `characters` with an index
#    - if index is even, push uppercased version of `character` in `result`
#    - if index is odd, push lowercased version of `character` in `result`o
#  - return `result`

def staggered_case(string)
  result = string.chars.map.with_index do |char, index|
    if index.even?
      char.upcase
    elsif index.odd?
      char.downcase
    else
      char
    end
  end
  result.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# FURTHER EXPLORATION
# Modify the method so that it takes an additional parameter signaling
# whether it should start capitalizing on the first character or the second
# character of the string.
# We'll assume that the argument will only ever be either `:odd` or `:even`

def staggered_case_opt(string, capitalize = :odd)
  capitalize == :odd ? process = true : process = false

  result = string.chars.map do |char|
    process ? char.upcase! : char.downcase!
    process = !process
    char
  end

  result.join
end

puts '-- Further exploration'
p staggered_case_opt('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case_opt('ALL_CAPS', :even) == 'aLl_cApS'
p staggered_case_opt('ignore 77 the 444 numbers', :odd) == 'IgNoRe 77 ThE 444 NuMbErS'
