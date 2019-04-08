# Write another method that returns `true` if the string passed as an argument
# is a palindrome, `false` otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters. If
# you wish, you may simplify things by calling the palindrome? method you
# wrote in the previous exercise.

# Examples
# real_palindrome?('madam') == true
# real_palindrome?('Madam') == true           # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653') == true
# real_palindrome?('356a653') == true
# real_palindrome?('123ab321') == false

# ANSWER
# ======
# input: string
# output: boolean
# rules:
#  - spaces and non-alphanumeric characters do not matter
# examples:
# real_palindrome?('1madam1') == true
# real_palindrome?('Madam') == true
# real_palindrome?("Madam, I'm Adam") == true
# data structures:  not sure, nothing fancy perhaps
# algorithm
# 1. given a string
# 2. store in `clean_string` a version of the argument with only
#    alphanumberic characters
# 3. if `clean_string` reads the same in reverse, then return true
#    if not, return false
# code:

def real_palindrome?(string)
  clean_string = string.downcase.gsub(/[^123456789abcdefghijklmnopqrstuvwxyz]/, '')
  clean_string == clean_string.reverse
end

p real_palindrome?('1madam1') == true
p real_palindrome?('Madam') == true
p real_palindrome?('mesdames') == false
p real_palindrome?("Madam, I'm Adam") == true
p real_palindrome?("Madam, I'm Adam") == true
