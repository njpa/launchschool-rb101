# PROBLEM
#
# mental model:
# assumptions:

# EXAMPLES


# DATA STRUCTURES
#

# =============================================================================
# ANSWER
# ------
# DONE:
# STARTED:
# DURATION:

def valid_number?(str)
  str.include?(".") ? (str.to_f.to_s == str) : (str.to_i.to_s == str)
end

loop do
  loan_amount = nil
  puts ">> Please enter the loan amount (e.g. 300000):"

  loop do
    loan_amount = gets.chomp

    break if valid_number?(loan_amount)
    puts ">> Please enter a valid number (e.g. 300000):"
  end
  loan_amount = loan_amount.to_f

  puts ">> Please enter the Annual Percentage Rate (APR) (e.g. 2.5):"
  apr = nil
  loop do
    apr = gets.chomp

    break if valid_number?(apr)
    puts ">> Please enter a valid number (e.g. 2.5):"
  end
  apr = apr.to_f
  mpr = (apr / 12) / 100

  puts ">> Please enter the loan duration in years (e.g. 30):"
  duration_years = nil
  loop do
    duration_years = gets.chomp

    break if valid_number?(duration_years)
    puts ">> Please enter a valid number (e.g. 30):"
  end
  duration_years = duration_years.to_i
  duration_months = duration_years * 12

  monthly_payment =  loan_amount * (mpr / (1 - (1 + mpr)**(-duration_months)))

  puts "Your monthly interest rate is #{(mpr * 100).round(2)}%"
  puts "Your loan duration in months is #{duration_months.to_i}"
  puts "Your monthly payment is #{monthly_payment.round(2)}"

  puts "Would you like to perform a new calculation? (y/n)"
  repeat = gets.chomp

  break unless repeat == "y"
end

puts "Thanks for using the mortgage calculator!"

puts "-----"
# =============================================================================
# ALTERNATE ANSWER
# ----------------
# DONE:
# STARTED:
# DURATION:
