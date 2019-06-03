=begin

Name Swapping
-------------
Write a method that takes a first name, a space, and a last name passed as
a single String argument, and returns a string that contains the last name, a
comma, a space, and the first name.

Examples

swap_name('Joe Roberts') == 'Roberts, Joe'

PEDAC
=====
string -> string
- method
- string argument contains first name, space, last name
- return string contains last name, comma, space, first name
question: same string? we'll assume not
examples:
swap_name('Joe Roberts') == 'Roberts, Joe'
data structures: string ;)
algorithm:
- given str
- split str by ' ' and store first element in first_name
  and second element in last_name
- return interpolated string with requirements

TIMING
======
19:31 pedac
19:34 code
19:35 done

=end

def swap_name(str)
  first_name, last_name = str.split
  "#{last_name}, #{first_name}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
