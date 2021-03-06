=begin

1000 Lights
===========
You have a bank of switches before you, numbered from 1 to `n`. Each switch is
connected to exactly one light that is initially off. You walk down the row
of switches and toggle every one of them. You go back to the beginning,
and on this second pass, you toggle switches 2, 4, 6, and so on. On the third
pass, you go back again to the beginning and toggle switches 3, 6, 9, and so
on. You repeat this process and keep going until you have been through `n`
repetitions.

Write a method that takes one argument, the total number of switches, and
returns an Array that identifies which lights are on after n repetitions.

Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4.
The return value is `[1, 4]`.

With 10 lights, 3 lights are left on: lights 1, 4, and 9.
The return value is `[1, 4, 9]`.

pedac
=====
int -> arr
- a method
- array identifies which lights are on after `n` repetitions
- int is total number of switches
- each light is initially off
- first pass: togge all of them
- second pass: toggle switches 2, 4, 6, ....
- third pass: toggle switches 3, 5, 7, ....
- fourth pass: toggle switches 4, 6, etc.
  this goes on until `n` repetitions are done
mental model: write a method that goes through an array of elements, which
are initially all `0`s, and toggles `0`s to `1`s and `1`s to `0`s the same
amount of times as number of elements in the array. The first pass will
toggle all elements, and the following passes will start toggling only
those elements starting at the following position (2nd pass starts at position
2, third pass starts at position 3, etc).  Whereas the first pass toggles all
elements, the second pass (and all other passes which are even numbered) will
only toggle those elements that are in even positions, and the third pass (and
all other passes that are odd numbered) will only toggle those elements that
are in odd positions.
data structure: new array for holding switches
algorithm:
- given `n`
- initialize `arr` and set to array of `n` elements of `0`
- from 1 to `n`
  - if `n` is equal to `1`
    toggle all switches
  - else if `n` is even
    toggle all even switches starting at position `n`
  - else if `n` is odd
    toggle all odd switches starting at position `n`
- initialize `switched_on` and set to `[]`
- put into `switched_on` the `indeces + 1` of each position where the element
  is equal to `1`

time
====
13:41 started pedac
13:49 pause (phone call)
13:52 resume (phone call ended)
13:59 stopped pedac, started coding
14:32 lunch break finished (just needed to write method that would return
  array of positions of an argument array in which element is equal to `1`
15:50: started again
15:54 done

=end

def switch_lights(number_switches)
  arr = [0] * number_switches

  1.upto(number_switches) do |pos|
    if pos == 1
      arr.each_with_index do |elem, ind|
        arr[ind] = switch(elem)
      end
    else
      arr.each_with_index do |elem, ind|
        if (ind + 1) >= pos && (ind + 1) % pos == 0
          arr[ind] = switch(elem)
        end
      end
    end
  end

  positions_on(arr)
end

def positions_on(array)
  array.each_with_object([]).with_index do |(elem, arr), ind|
    arr << (ind + 1) if elem == 1
  end
end

def switch(light)
  light == 0 ? 1 : 0
end

p switch_lights(5) == [1, 4]
p switch_lights(10) == [1, 4, 9]

# alternative
# We can use a hash to store the lights.  The key can represent the
# position, and the value will represent the state of the light ('on' / 'off')
# Tips:
# 1. break out the initialization of the hash to a method
# 2. assign the logic of returning the array with the positions of lights
# that are switched 'on' to a method
# 3. use `Hash#select` and `Hash#keys` to get the positions of 'on' lights
# 4. there's no real need to check for the current iteration being greater
#     than or equal to the position, since we are going to apply the light
#     switching to multiples of the position (this means that, by definition,
#     only numbers greater than the position will be consideded).
# 5. the guard clause for the first iteration is also not necessary since
#    all numbers are multiples of `1`.
# 6. there's no real need to break out the logic to switch a single light
#    to a method.

def initialize_lights(number)
  lights = Hash.new
  1.upto(number) { |pos| lights[pos] = 'off' }
  lights
end

def on_positions(lights)
  lights.select { |_pos, state| state == 'on' }.keys
end

def switch_lights_from(lights, position)
  lights.each do |pos, _|
    if pos % position == 0
      lights[pos] = lights[pos] == 'on' ? 'off' : 'on'
    end
  end
end

def switch_lights_alt(number)
  lights = initialize_lights(number)
  1.upto(number) do |position|
    switch_lights_from(lights, position)
    p lights
  end
  on_positions(lights)
end

puts '-- Alternative'
#p switch_lights_alt(5) == [1, 4]
#p switch_lights_alt(10) == [1, 4, 9]
p switch_lights_alt(16)# == [1, 4, 9, 16]


def lights(n)
  switches = {}
  1.upto(n) do |i|
    counter = i
    step = i
    loop do
      break if counter > n
      switches[counter] = case switches[counter]
                          when 'on' then 'off'
                          else 'on'
                          end
      counter += step
    end
  end
  switches.select { |_, v| v == 'on' }.keys
end

puts '---'
p lights(16)
