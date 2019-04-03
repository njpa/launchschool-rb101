# Print the even numbers from 1 to 99, inclusive. All numbers should be
# printed on separate lines.

counter = 0

loop do
  break if counter >= 99

  counter += 1

  next if counter % 2 == 1

  puts counter

end
