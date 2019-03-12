# Alyssa was asked to write an implementation of a rolling buffer. Elements are
# added to the rolling buffer and if the buffer becomes full, then new elements
# that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like `<<` or
# `+` for modifying the buffer?". Is there a difference between the two,
# other than what operator she chose to use to add an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# ANSWER
# There is a difference between the two.  `rolling_buffer1` has the side effect
# of mutating the `buffer` parameter.  If the intention is to invoke the method
# with the aim of storing the return value in a new variable,
# then either method will have the intended result.  However, if we wish to
# invoke the method with the aim of having it mutate the `buffer` argument
# provided, `rolling_buffer2` will not meet the requirement.

buffer = [1,2,3,4,5]
buffer_rolled = rolling_buffer1(buffer, 5, 6)
p buffer
p buffer_rolled

buffer = [1,2,3,4,5]
buffer_rolled = rolling_buffer2(buffer, 5, 6)
p buffer
p buffer_rolled
