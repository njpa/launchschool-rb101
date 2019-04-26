# Using the `each` method, write some code to output all of the vowels from
# the strings.

hsh = {first: ['the', 'quick'],
       second: ['brown', 'fox'],
       third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']}

# ANSWER
# ======
hsh.each_value do |strings|
  letters = strings.join.split('')
  letters.each { |letter| puts letter if 'aeiou'.include?(letter) }
end
