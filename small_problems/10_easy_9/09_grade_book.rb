=begin

Grade book
==========
Write a method that determines the mean (average) of the three scores passed
to it, and returns the letter value associated with that grade.

Numerical Score Letter  Grade
  90 <= score <= 100    'A'
  80 <= score < 90      'B'
  70 <= score < 80      'C'
  60 <= score < 70      'D'
  0 <= score < 60       'F'

Tested values are all between 0 and 100. There is no need to check for
negative values or values greater than 100.

Example:

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

pedac
=====
int -> int -> int -> string
- mean is calculated from three arguments
- rules to associate letter grade to mean is in table above
- values are always between 0 and 100 (no need to validate)
questions:
- should we use floats for mean calculation? we'll assume so
- should we round up to the nearest whole number? we'll assume so
examples:
  get_grade(95, 90, 93) == "A"
  get_grade(50, 50, 95) == "D"
  get_grade(80, 80, 79) == "B" # the mean 79.666 rounds to 80
data structures: hash to store grades
algorithm:
- given grade1, grade2, grade3
- instantiate `mean` and set to `0`
- store mean of grade1, grade2, and grade3 in `mean`
- round mean to nearest whole number
- instantiate `grades` and set to hash as follows
  {'A' => 90..100, 'B' => 80..89, 'C' => 70..79, 'D'=> 60..69,
   'F' => 0..59}
- instantiate `grade` and set to `''`
- for each element in `grades`
  assign `grade` to `key` if `value` contains `mean`
- return `grade`

stopwatch
=========
20:13 pedac
20:24 code
20:28 done

=end

def get_grade(grade1, grade2, grade3)
  grades = { 'A' => 90..100, 'B' => 80..89, 'C' => 70..79,
             'D'=> 60..69, 'F' => 0..59 }
  grade = ''
  mean = ((grade1 + grade2 + grade3) / 3.0).round

  grades.each { |key, val| grade = key if val.include?(mean) }

  grade
end

p get_grade(95, 90, 93) == "A" # => true
p get_grade(50, 50, 95) == "D" # => true
p get_grade(80, 80, 79) == "B" # => true
                               # the mean 79.666 rounds to 80

# Alternative
# ===========
# We can also use a `case` statement insted of relying on a hash.

def get_grade_alt(grade1, grade2, grade3)
  mean = ((grade1 + grade2 + grade3) / 3.0).round

  case
  when mean >= 90 then 'A'
  when mean >= 80 then 'B'
  when mean >= 70 then 'C'
  when mean >= 60 then 'D'
  else                 'F'
  end
end

puts '-- alternative'
p get_grade_alt(95, 90, 93) == "A" # => true
p get_grade_alt(50, 50, 95) == "D" # => true
p get_grade_alt(80, 80, 79) == "B" # => true
                               # the mean 79.666 rounds to 80


# Validation
# ==========
# Since the comparison used by the `case` statement returns `true` if
# a provided range includes the object we can do the `case` statement
# as follows:


def get_grade_val(grade1, grade2, grade3)
  case ((grade1 + grade2 + grade3) / 3.0).round
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

puts '-- further alternative'
p get_grade_val(95, 90, 93) == "A" # => true
p get_grade_val(50, 50, 95) == "D" # => true
p get_grade_val(80, 80, 79) == "B" # => true
                               # the mean 79.666 rounds to 80
