# Back in the stone age (before CSS) we used spaces to align things on the
# screen. If we had a 40 character wide table of Flintstone family members,
# how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"

# PSEUDOCODE
# set a constant `total_width` = 40
# obtain length of string
# set length of string in `title_width`
# deduce padding required on left and right
#    left_padding_width = (total_width - title_width) / 2
#    right_padding_width = left_padding_width
# take into consideration that the total width can be an odd number
#    if title_width is odd
#      right_padding_width += 1
# create strings for left and right padding
# set centered_title =
#   concatenated left padding string, title and right padding string
# print out centered_title

TOTAL_WIDTH = 40
title_width = title.length

left_padding_width = (TOTAL_WIDTH - title_width) / 2
right_padding_width = left_padding_width

right_padding_width += 1 if title_width.odd?

left_padding = '*' * left_padding_width
right_padding = "*" * right_padding_width

centered_title = left_padding << title << right_padding
puts centered_title

# ALTERNATIVE
# Or, we could invoke `String#center` on `title` passing in `40` as the first
# parameter (the 'width') and '*' as the second parameter
# (the 'padding string').

puts title.center(40, '*')
