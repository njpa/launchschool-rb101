=begin
Unlucky Days

Write a method that returns the number of Friday the 13ths in the year given by an
argument. You may assume that the year is greater than 1752 (when the United
Kingdom adopted the modern Gregorian Calendar) and that it will remain in use
for the foreseeable future.

start: 17:23/17:32/17:34
input: integer, year
output: integer, occurences of friday, 13 in all 12 months of that year

ALGO
- given `year`
- instantiate `occurences` and set to `0`
- create a new date with `year` and store in `date`
- for each month in that `date`
-   check if the 13th in that month is a friday
-   if so, increment occurences by 1
- return `occurences`
=end

require 'date'

def friday_13th(year)
	days = (1..12).map { |month| Date.new(year, month, 13) }
  days.count { |day| day.friday? }
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
