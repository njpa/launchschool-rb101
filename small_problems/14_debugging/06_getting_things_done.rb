=begin
Getting Things Done

We wrote a method for moving a given number of elements from one array to
another. We decide to test it on our todo list, but invoking `move` on line 11
results in a `SystemStackError`. What does this error mean and why does it
happen?
=end

def move(n, from_array, to_array)
  return if n == 0

  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# ANSWER
# ======
# The `move` method attempts to move `n` number of elements from one array to
# another by way of recursively calling itself.   The problem is that there is
# no condition to meet before the method calls can start returning actual values
# back up the call stack.  Ruby throws the `SystemStackError` as a consequence
# of this.
# To fix this, we can add a condition that checks if `n` is equal to `0` and
# if so, returns `nil`, thereby halting recursion.




