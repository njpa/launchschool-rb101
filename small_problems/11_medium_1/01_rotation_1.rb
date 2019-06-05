=begin

Rotation (Part 1)
=================
Write a method that rotates an array by moving the first element to the end
of the array. The original array should not be modified.

Do not use the method `Array#rotate` or `Array#rotate!` for your implementation.

Example:

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

pedac
=====
arr -> arr
- return array is rotated (first element is moved to the end of array)
- original array should not be modified
- cannot use `#rotate`
- question: empty array? assume empty array is returned
ex:
  rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
  rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
  rotate_array(['a']) == ['a']
structs: new array
algo:
- given `arr`
- instantiate `res` and set to `[]`
- instantiate `size` and set to size of `arr`
- map `arr` as is and store in `res`
- get `first_element` from `res` and remove from `res`
- append `first_element` to `res`

time
====
13:48 start pedac
13:54 start code
13:56 done code
14:00 refactor done
14:13 further exploration done

=end

def rotate_array(arr)
  res = arr.map { |elem| elem }

  first_element = res.shift
  res.push(first_element)

  res
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# refactor

def rotate_array_re(arr)
  res = arr.dup
  res.push(res.shift)
end

puts '-- refactor'
p rotate_array_re([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array_re(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array_re(['a']) == ['a']
x = [1, 2, 3, 4]
p rotate_array_re(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

# -- alternative
# We can use array element referencing and get a subarray of the argument
# providing the `#[]` method a range as argument.  And then we can simply
# concatenate to that subarray, the first element of the argument array.

def rotate_array_alt(arr)
  arr[1..-1] + [arr[0]]
end

puts '-- alternative'
p rotate_array_alt([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array_alt(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array_alt(['a']) == ['a']
x = [1, 2, 3, 4]
p rotate_array_alt(x) == [2, 3, 4, 1] # => true
p x == [1, 2, 3, 4]                 # => true

# -- further exploration
=begin
Write a method that rotates a string instead of an array. Do the same
thing for integers. You may use `rotate_array` from inside your new method.

pedac
=====
mental model: write a method that splits a string into characters into an
array, and invokes `rotate_array` passing in that array to obtain a
rotated version of the string

=end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_number(num)
  rotate_array(num.digits.reverse).join.to_i
end

puts '-- further exploration'
p rotate_string("hello world") == "ello worldh"
p rotate_number(91456) == 14569
p rotate_number(90456) == 4569
