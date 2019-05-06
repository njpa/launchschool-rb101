# You are given a method named spin_me that takes a string as an argument
# and returns a string that contains the same words, but with each word's
# characters reversed. Given the method's implementation, will the returned
# string be the same object as the one passed in as an argument or a different
# object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# ANSWER
# ======
# The original string that is sent in as argument, and which is then
# referenced by the method parameter `str`, has the `String#split`
# method invoked on it.  This will provide the return value that
# then calls the `Array#each` method. At this point, we can already
# see that the return value of the method is a new object.

string = 'spin me around'
p string.object_id
test = spin_me(string)
p test.object_id
