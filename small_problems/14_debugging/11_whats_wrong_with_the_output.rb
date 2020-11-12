=begin
What's wrong with the output?

Josh wants to print an array of numeric strings in reverse numerical order.
However, the output is wrong. Without removing any code, help Josh get the
expected output.
=end


arr = ["9", "8", "7", "10", "11"]

p arr.sort do |x, y|
   y.to_i <=> x.to_i
end

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]

# ANSWER
# ======
# The documentation of `Kernel#p` tells us that it writes `obj.inspect` on every
# object as can be seen in the signature `p(obj) → obj`.   If we provide the block
# to the `sort` invocation using `do...end`, the `p` invocation seems to take in
# only the return value of `arr.sort` as the argument.  The `p` invocation then
# simply returns `arr` sorted in alphabetical order since the block is ignored.

# We can overcome this by one of two ways:
# We can use an inline block as shown below.

p arr.sort { |x, y| y.to_i <=> x.to_i }
  # => ["11", "10", "9", "8", "7"]

# Likewise, we can also use assignment to store the return value of the entire
# expression and then simply pass in that variable to the `Kernel#p` invocation
# as seen below:

ordered =
  arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

p ordered # => ["11", "10", "9", "8", "7"]
