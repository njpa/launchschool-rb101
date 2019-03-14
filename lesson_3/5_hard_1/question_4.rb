# Ben was tasked to write a simple ruby method to determine if an input string
# is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is
# not familiar with regular expressions. Alyssa supplied Ben with a method
# called `is_an_ip_number?` that determines if a string is a numeric string
# between `0` and `255` as required for IP numbers and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few
# things. You're not returning a false condition, and you're not handling the
# case that there are more or fewer than 4 components to the IP address (e.g.
# "4.5.5" or "1.2.3.4.5" should be invalid)."

# Help Ben fix his code.

# ANSWER
# ======
# We'll first need to account for checking the number of components to the IP
# address.  We will check that the size of `dot_separated_ip_address` array
# is equal to `4` and return false if it is not.
# If the `ip_number?` invocation returns `false` we could immediately
# return `false` explicitly for this method and call it a wrap.  For this
# purpose, we will add an explicit `return` statement and provide it a
# conditional statement that will check if the `word` is valid.
# We'll then add `true` as the last line so that the method returns `true`
# if it has passed all of the checks.

def ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while !dot_separated_words.empty?
    word = dot_separated_words.pop
    return false unless ip_number?(word)
  end
  true
end

def ip_number?(str)
  if number?(str)
    return true if str.to_i >= 0 && str.to_i <= 255
  end
  false
end

def number?(str)
  str.to_i.to_s == str
end

puts ip_address?("1.2.3") # => false
puts ip_address?("1.2.3.4.5") # => false
puts ip_address?("1.256.3.4") # => false
puts ip_address?("-1.2.3.4") # => false
puts ip_address?("1.256.3.4") # => false
puts ip_address?("1.2.3.4") # => true
