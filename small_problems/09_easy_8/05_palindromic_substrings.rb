# Write a method that returns a list of all substrings of a string that
# are palindromic. That is, each substring must consist of the same sequence
# of characters forwards as it does backwards. The return value should be
# arranged in the same sequence as the substrings appear in the string.
# Duplicate palindromes should be included multiple times.

# You may (and should) use the `substrings` method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and
# pay attention to case; that is, `"AbcbA"` is a palindrome, but neither `"Abcba"`
# nor `"Abc-bA"` are. In addition, assume that single characters are not palindromes.

# Examples:

# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# ANSWER
# ======
# string -> array
# - array must contain all substrings of the string that are palindromic
# - palindrome is a strign that has same sequence of characters backwards
#   as it does forwards
# - pay attention to case
# - single characters are not palindromes
# - use `substrings` method
# data structures: new array containing palindromic substrings
# algorithm:
# - given `string`
# - instantiate `substrings`
# - instantiate `palindromes` and set to `[]`
# - obtain all substrings from `string` and store in `substrings`
# - for every `substring` in `substrings`
#   - if it is a palindrome,
#     push it into `substrings`
# - return `palindromes`

def palindromes(string)
  substrings = substrings(string)
  palindromes = []

  substrings.each do |substring|
    if substring == substring.reverse and substring.size > 1
      palindromes.push(substring)
    end
  end

  palindromes
end

def substrings(string)
  res = []

  0.upto(string.size) do |count|
    str = string[count..(string.size)]
    substrings_at(str).each { |str| res.push(str) }
  end

  res
end

def substrings_at(str)
  str.chars.each_with_object([]).with_index do |(_, obj), ind|
    substring = str[0..ind]
    obj.push(substring) unless substring.empty?
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('Madam') == ['ada']
p palindromes('hello-madam-did-madam-goodbye') == [
   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
   '-madam-', 'madam', 'ada', 'oo'
 ]
 palindromes('knitting cassettes') == [
   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
 ]

# REFACTOR
# ========

def palindromes_re(string)
  substrings(string).each_with_object([]) do |sub, arr|
    arr.push(sub) if sub == sub.reverse && sub.size > 1
  end
end

puts '-- Refactor'
p palindromes_re('abcd') == []
p palindromes_re('madam') == ['madam', 'ada']
p palindromes_re('Madam') == ['ada']
p palindromes_re('hello-madam-did-madam-goodbye') == [
   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
   '-madam-', 'madam', 'ada', 'oo'
 ]
 palindromes_re('knitting cassettes') == [
   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
 ]

# FURTHER EXPLORATION
# ===================
# Can you modify this method (and/or its predecessors) to ignore
# non-alphanumeric characters and case? Alphanumeric characters are
# alphabetic characters(upper and lowercase) and digits.

# ANSWER
# ------
# Questions: would `'abcb-a'` be palindromic?  We'll assume so.
# Questions: would `'a2bcb a'` be palindromic?  We'll assume so.

def palindromes_nonalphanumeric(string)
  substrings(string).each_with_object([]) do |sub, arr|
    arr.push(sub) if palindromic?(sub)
  end
end

def palindromic?(string)
  temp_string = string.gsub(/[^a-zA-Z0-9]/, '').downcase
  temp_string == temp_string.reverse && temp_string.size > 1
end

puts '-- Further exploration'
p palindromes_nonalphanumeric('M2a@d am') == ['a@d a']
