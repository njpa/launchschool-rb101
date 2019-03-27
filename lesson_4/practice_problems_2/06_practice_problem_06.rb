# Amend this array so that the names are all shortened to just the first
# three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Approach 1 (destructive)
flintstones.map! do |member|
  member = member[0,2]
end

p flintstones

# Approach 2 (non-destructive)
short_flintstones = flintstones.map { |item| item[0,2] }

p short_flintstones
