=begin

Problem
=======

Given a string, write a method `palindrome_substrings` which returns
all the substrings from a given string which are palindromes. Consider
palindrome words case sensitive.

Test cases:

palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") == []
palindrome_substrings("") == []

PEDAC (10:49-10:58-11:04)
=====
string -> array of substrings
- return array contains substring of argument which are palindromes
- palindromes read backwards and forwards equally
- method, not program
- empty strings provided, empty array returned
q: should the palindromes be case-sensitive? Assume so.
q: should i validate for string input? Assume not.
q: is a one-letter word a palindrome? Assume not, only bigger than 1
ds: new array for return value
ds: maybe array of characters?
algorithm:
Given str
SET result = []
SET chars = characters in str
SET counter = 0
WHILE counter < size of chars
  SET inner_counter = counter
  WHILE inner_counter < size of chars
    SET substring = chars[counter..inner_counter]
    IF substring = reversed version of substring
      UPDATE result by pushing substring into it
    END
    SET inner_counter += 1
  END
  SET counter += 1
END

=end

def palindrome_substrings(string)
  result = []
  chars = string.chars
  chars_size = chars.size
  counter = 0

  while counter < chars_size
    inner_counter = counter + 1

    while inner_counter < chars_size
      substring = string[counter..inner_counter]
      result << substring if palindrome?(substring)

      inner_counter += 1
    end
    counter += 1
  end

  result
end

def palindrome?(string)
  string == string.reverse
end

p palindrome_substrings("supercalifragilisticexpialidocious") ==
                ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []


