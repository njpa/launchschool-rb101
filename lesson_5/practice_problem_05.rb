# Given this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# figure out the total age of just the male members of the family.

# ANSWER
# ======
male = []
munsters.each do |key, val|
	male << val['age'] if val['gender'] == 'male'
end
p male.reduce(:+)

# ALTERNATIVE
# ===========
# We can also invoke the `Hash#each_value` method since we are not referencing
# by key.

total = 0
munsters.each_value do |details|
	total += details['age'] if details['gender'] == 'male'
end
p total
