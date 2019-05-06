# Write a method that will take a short line of text, and print it within
# a box.
#
# Example:
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
#
# ANSWER
# ======
# input: string
# output: no return, 5 strings outputted
# rules:
# - line 3 has '| ' prepended and ' |' appended to input string
# - lines 2 and 4 consist of '|' + ((input_length + 2) * ' ') + '|'
# - lines 1 and 5 consist of '+' + ((input_length + 2) * '-') + '+'
# algorithm:
# - instantiate `border` and set to '+' + ((input_length + 2) * '-') + '+'
# - instantiate `padding` and set to '|' + ((input_length + 2) * ' ') + '|'
# - output `border`
# - output `padding`
# - output `text`
# - output `padding`
# - output `border`

def print_in_box(str)
  border = '+' + ('-' * (str.size + 2)) + '+'
  padding = '|' + (' ' * (str.size + 2)) + '|'
  text = '| ' + str + ' |'
  puts border, padding, text, padding, border
end

print_in_box('')
print_in_box('To boldly go where no one has gone before.')

def print_in_box_truncated(str)
  str = str[0..75] if str.size > 76
  border = '+' + ('-' * (str.size + 2)) + '+'
  padding = '|' + (' ' * (str.size + 2)) + '|'
  text = '| ' + str + ' |'
  puts border, padding, text, padding, border
end

print_in_box_truncated("Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal")
print_in_box_truncated("Modify this method so it will truncate the message if it will be too wide to fit") # 80 characters

# FURTHER EXPLORATIION
# ====================
# Modify this method so it will truncate the message if it will be too wide
# to fit inside a standard terminal window (80 columns, including the sides
# of the box). For a real challenge, try word wrapping very long messages so
# they appear on multiple lines, but still within a box.
#
# ANSWER
# rules:
# - line 3 has '| ' prepended and ' |' appended to input string
# - lines 2 and 4 consist of '|' + ((input_length + 2) * ' ') + '|'
# - lines 1 and 5 consist of '+' + ((input_length + 2) * '-') + '+'
# ALGORITHM
# - given `str`
# - instantiate `lines` and set to `[]`
# - [sub] store, in `lines`, `str` in sets of up to 80 characters
# - instantiate `border` and set to '+' + ((input_length + 2) * '-') + '+'
# - instantiate `padding` and set to '|' + ((input_length + 2) * ' ') + '|'
# - output `border`
# - output `padding`
# - for each `line` in `lines`, output `line`
# - output `padding`
# - output `border`
# - [sub] store in `lines`, `str` in sets of 80 character strings
#   - get number of lines needed, and store in `num_lines`
#   - instantiate `current_start_line` and set to 0
#   - while the size of `str` with a range of `str` from current_set to
#       current_set + 80 is equal to `80`
#     - push substring of `str` from characters 0 to `current_set`
#       to xx into `lines`
#     - increment `current_set` by 80

TEXT_WIDTH = 76

def print_in_box_paragraph(str)
  str.size > TEXT_WIDTH ? width = TEXT_WIDTH : width = str.size
  puts border = '+' + ('-' * (width + 2)) + '+'
  puts padding = '|' + (' ' * (width + 2)) + '|'
  in_lines(str, width).each { |line| puts '| ' + line + ' |' }
  puts padding, border
end

def in_lines(string, width)
  lines = []
  loop do
    line = string.slice!(0, width)
    line = line + (' ' * (width - line.size)) if line.size != width
    lines << line
    break if string.empty?
  end
  lines
end

puts '-- Further exploration'
print_in_box_paragraph('If the limit parameter is omitted, trailing null fields are suppressed.')
print_in_box_paragraph('If the limit parameter is omitted, trailing null fields are suppressed. If limit is a positive number, at most that number of split substrings will be returned (captured groups will be returned as well, but are not counted towards the limit). If limit is 1, the entire string is returned as the only entry in an array. If negative, there is no limit to the number of fields returned, and trailing null fields are not suppressed.')
