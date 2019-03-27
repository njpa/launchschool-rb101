# In the age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# throw out the really old people (age 100 or older).

# Approach 1
# ----------
young_people = {}

keys = ages.keys
counter = 0
loop do
  break if counter == keys.length

  young_people[keys[counter]] = ages[keys[counter]] if ages[keys[counter]] < 100
  counter += 1
end

p young_people

# Approach 2 (non-destructive)
# ----------------------------
young_people = ages.select { |key, val| val < 100 }
p young_people

# Approach 3 (destructive)
# ----------------------------
p ages.select! { |key, val| val < 100 }
