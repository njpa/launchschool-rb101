# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the
# days before computers had video screens).

# For this practice problem, write a one-line program that creates the
# following output 10 times, with the subsequent line indented 1 space to the
# right:

# =>The Flintstones Rock!
# => The Flintstones Rock!
# =>  The Flintstones Rock!

# PSEUDOCODE
# set output_times = 10
# set text = 'The Flintstones Rock!'
# instantiate padding = " "
# loop output_times times
#   set string equal to padding times the current output time
#   output text preceded by padding

text = 'The Flintstones Rock!'
10.times do |time|
  padding = ' ' * time
  puts padding << text
end

# We can one line it as so:

10.times { |time| puts((' ' * time) << 'The Flintstones Rock!') }
