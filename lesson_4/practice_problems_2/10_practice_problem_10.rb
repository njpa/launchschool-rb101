# Given the `munsters` hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Modify the hash such that each member of the Munster family has an
# additional "age_group" key that has one of three values describing the
# age group the family member is in (kid, adult, or senior). Your solution
# should produce the hash below

{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64
# and a senior is aged 65+.

# ANSWER
# ======
# Algorithm:
# 1. get keys from `munsters` and store in `keys`
# 2. iterate through `keys`
# 3. determine the `age_group` based on the `age` key, after having obtained
#    it through element reference.
# 4. Using element assignment, insert a new key `age_group` with the
#    corresponding value.

keys = munsters.keys

keys.each do |member|
  if munsters[member]["age"] < 17
    age_group = 'kid'
  elsif munsters[member]["age"] < 64
    age_group = 'adult'
  else
    age_group = 'senior'
  end
  munsters[member]["age_group"] = age_group
end

p munsters

# REFACTOR
# ========
# Let's use a `case` statement with `Range` objects for the conditionals.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
keys = munsters.keys

keys.each do |member|
  case munsters[member]["age"]
  when 0..17   then age_group = 'kid'
  when 17..64  then age_group = 'adult'
  else              age_group = 'adult'
  end
  munsters[member]["age_group"] = age_group
end

p munsters

# REFACTOR
# ========
# You can iterate over the hash directly using `Hash#each`, which will
# provide you with two block parameters that reference the current key
# and value.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key,val|
  case val["age"]
  when 0..17   then val["age_group"] = 'kid'
  when 17..64  then val["age_group"] = 'adult'
  else              val["age_group"] = 'adult'
  end
end

p munsters
