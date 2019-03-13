# Every named entity in Ruby has an `object_id`. This is a unique identifier
# for that object.

# It is often the case that two different things "look the same", but they can
# be different objects. The "under the hood" object referred to by a
# particular named-variable can change depending on what is done to that
# named-variable.

# In other words, in Ruby everything is an object...but it is not always THE
# SAME object.

# Predict how the values and object ids will change throughout the flow of the
# code below:

# ANSWER
# The answer is contained in the comments inside of the method.

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts <<-MSG
    ======
    The object_ids of the variables will be the same before the block and
    outside the block.  The values of the variables will also be the same.
    --
    MSG
    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block."
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block."
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block."
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block."

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts <<-MSG
    ======
    All four of the variables's values will be different.
    The object_ids of `a_outer`, `b_outer`, `outer_c` will be different due
    to the reassignments above and due to the fact that this block-level
    scope can access local variables in its immediate outer-scope.
    `d_outer` will have also have a new object_id since it is referencing a
    reassigned element in `c_outer`.
    --
    MSG
    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."

    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts <<-MSG
    =====
    `a_inner_id` will be the same as `a_outer.object_id`
    `b_inner_id` will be the same as `b_outer.object_id`
    `c_inner_id` will be the same as `c_outer.object_id`
    `d_inner_id` will be the same as `d_outer.object_id`
    --
    MSG
    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
  end

  puts %(
  =====
  value of `a_outer` is `22`, `a_outer_id` & `a_outer.object_id` are
  not the same.
  value of `b_outer` is `'thirty-three`, `b_outer_id` & `b_outer.object_id`
  are not the same.
  value of `c_outer` is `[44]`, `c_outer_id` and c_outer.object_id` are
  not the same.
  value of `d_outer` is `44`, `d_outer_id` and d_outer.object_id` are
  not the same.
  --
  )
  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."

  puts %(
  =====
  Trying to access any of these variables will raise a `NameError` exception
  since they are instantiated inside of a block and their scope does not
  reach the outer scope of the block.
  By adding the block of error-handling code in `rescue`, the program will
  gracefully output `'ugh ohhhhh'`.
  --
  )
  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end

fun_with_ids()
