# Amend this array so that the names are all shortened to just the first
# three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Approach 1
# ----------
flintstones.each do |member|
  member = member[0,2]
end
p flintstones


