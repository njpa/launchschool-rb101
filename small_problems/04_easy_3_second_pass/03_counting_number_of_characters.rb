puts "Please write word or multiple words:"
string = gets.chomp
size = string.gsub!(" ", "").size
puts "There are #{size} characters in \"#{string}\"."
