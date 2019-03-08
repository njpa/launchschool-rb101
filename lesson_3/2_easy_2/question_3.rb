# We have most of the Munster family in our age hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

# add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

# Answer
# ------
# We'll iterate over `additional_ages` and insert each key in that hash into
# the ages using element assignment.
# We will do this by:
# 1. Invoking `Hash#each` on `additional_ages` and pass in a block with
# block parameters `key` and `value`.
# 2. In the block body, we will perform element assignment on `ages` using
# `Hash#[]` providing the block parameters to reference the key and value
# to be used in the assignment.

additional_ages.each do |key, value|
  ages[key] = value
end
p ages

# SUGGESTION
# ==========
# Go method hunting.  The `Hash#merge!` method modifies the caller by merging
# the hash provided as argument.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
ages.merge! additional_ages
p ages
