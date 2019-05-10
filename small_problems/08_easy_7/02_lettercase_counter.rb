# PROBLEM
# =======
# Write a method that takes a string, and then returns a hash that contains
# 3 entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.

# Examples:

# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# ANSWER
# =====
# Problem
#    input: string
#    output: hash
#    rules:
#    - hash has three keys,
#      lowercase: number of lowercase characters in string
#      uppercase: number of uppercase characters in string
#      neither: number of characters in string that are neither
# Examples: see above
# Data structures:
#  - new hash
#  - array (or simply string) to store uppercase characters
#  - array (or simply string) to store lowercase characters
# Algorithm:
#  - given `str`
#  - instantiate `entries` and set to
#    `{lowercase: 0, uppercase: 0, neither: 0}`
#  - for each `entry` in `entries`
#    - if `entry` is uppercase, increment `:uppercase` key in `entries` by 1
#    - if `entry` is lowercase, increment `:lowercase` key in `entries` by 1
#    - if `entry` is neither, increment `:neiher` key in `entries` by 1
#  - return `entries`
# Code:

def letter_case_count(string)
  entries = {lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |char|
    entries[:lowercase] += 1 if /[a-z]/.match(char)
    entries[:uppercase] += 1 if /[A-Z]/.match(char)
    entries[:neither] += 1 if /[^A-Za-z]/.match(char)
  end
  entries
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# ALTERNATIVE
# We can use the `String#=~` method, which returns an integer representing the index
# at which the first match of the provided regular expression is found in the caller.
# It returns `nil` if no match is found.
# And we can use `Array#count` which returns the number of elements in the caller,
# for which the supplied block has a return value of `true`

def case_count(string)
  entries = {}
  entries[:lowercase] = string.chars.count { |char| char =~ /[a-z]/ }
  entries[:uppercase] = string.chars.count { |char| char =~ /[A-Z]/ }
  entries[:neither] = string.chars.count { |char| char =~ /[^A-Za-z]/ }
  entries
end

puts '-- Alternative'
p case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# CONCISE

def case_counter(string)
  { lowercase: string.chars.count { |char| char =~ /[a-z]/ },
    uppercase: string.chars.count { |char| char =~ /[A-Z]/ },
    neither: string.chars.count { |char| char =~ /[^A-Za-z]/ } }
end

puts '-- Concise'
p case_counter('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p case_counter('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p case_counter('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p case_counter('') == { lowercase: 0, uppercase: 0, neither: 0 }
