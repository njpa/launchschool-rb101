# UNDERSTANDING THE PROBLEM
# -------------------------
# Input:
# - loan amount: float
# - annual percentage rate (APR): float
# - loan duration: float
# Output:
# - monthly payment: float
# Rules:
#   m = p * (j / (1 - (1 + j)**(-n)))
#   where
#     m = monthly payment
#     p = loan amount
#     j = monthly interest rate
#     n = loan duration in months
# Notes:
#   We have the `loan_amount` given, we can deduce the `monthly_interest_rate`
#   from the `annual_percentage_rate`, and we can deduce the
#   `loan_duration_months` from `loan_duration`.
# Tests:
#   monthly_payments(loan_amount=299_000, apr=3.5, loan_duration=30)   =>
#     monthly_interest = .2917 %
#     duration_in_months = 360 months
#     loan_amount = 299_000
#     monthly_payment = 299_000 * (0.002917 / (1 - (1 + 0.002917)**(-360)))
#                       1342.71
# Questions:
#   1) should we ask users to enter loan duration in months or years?
#    (We'll assume years, to keep it consistent with the APR)
#   2) can users enter anything other than whole years?
#     We'll assume the years have to be whole (i.e. 30 years)
#   3) should we have input validation on the loan amount, loan duration
#    and the APR?
#      We'll assume so.
#   3) should we ask users to enter percentages in decimals?
#      We'll assume so, and then we will convert it to the appropriate
#      percentage.
#
# CASUAL PSEUDO-CODE
# ------------------
# Obtain loan amount, validate input
# Obtain annual percentage rate, validate input
# Obtain loan duration, validate input
# Calculate and store monthly interest rate from the given APR
# Calculate and store loan duration in months from the given loan duration
# Calculate monthly payment (based on the provided formula) using the monthly
#   interest rate, loan duration in months, and loan amount
# Print out the monthly payment

# ALGORITHM
# ---------
# PRINT out introduction
# Ask user for loan amount (with no commas and decimals if needed)
# validate loan amount is a float
# SET loan_amount if valid
# Ask user for annual percentage rate (apr) (i.e. 5.3 would be 5.3%)
# validate annual percentage rate is a float
# SET `annual_percentage_rate` if valid
# ask user for loan duration in years (in whole numbers)
# validate duration is an integer
# calculate loan duration in months (loan duration * 12)
# SET loan_duration_in_months
# calculate monthly interest rate (annual_percentage_rate / 12)
# SET monthly_interest_rate
# calculate monthly_payment using the formula
#      m = p * (j / (1 - (1 + j)**(-n)))
# SET `monthly_payment`
# PRINT OUT `monthly_payment`

def prompt(message)
  puts "=>  #{message}"
end

def valid_float?(string)
  string.to_f.to_s == string
end

def valid_integer?(string)
  string.to_i.to_s == string
end

def monthly_payments(amount, months, interest)
  amount * (interest / (1 - (1 + interest)**-months))
end

prompt "Welcome to *** MORTGAGE CALCULATOR!"

prompt <<-MSG
  Please enter the loan amount:
  - Then number can have decimals.
  - Please do not enter any commas.
MSG
amount = nil
loop do
  amount = gets.chomp
  if valid_float?(amount) || valid_integer?(amount)
    break
  else
    prompt "Please enter a valid number!"
  end
end

prompt <<-MSG
  Please enter the loan duration in years:
  - This cannot be a decimal number
MSG
years = nil
loop do
  years = gets.chomp
  if valid_integer?(years)
    break
  else
    prompt "Please enter a valid number!"
  end
end

prompt <<-MSG
  Please enter the annual percentage rate in the following format:
  - For example, 5 and half percent would be `5.5`
MSG
interest = nil
loop do
  interest = gets.chomp
  if valid_float?(interest) || valid_integer?(interest)
    break
  else
    prompt "Please enter a valid number!"
  end
end

monthly_interest_rate = (interest.to_f / 12) / 100
months = years.to_i * 12
monthly_payment = monthly_payments(amount.to_f,
                                   months,
                                   monthly_interest_rate)

puts "It looks like you would be looking at monthly payments of about "
puts monthly_payment.round(2)

# THINGS TO THINK ABOUT
# =====================
# We can use the `Kernel#format` method, which takes a `format_string` as
# argument and returns a formatted string depending on the flags provided in
# the formatting sequence in the `format_string`.

puts "Your monthly payments will be of #{format('%.2f', monthly_payment)}"

# Other valid questions to ask could have been:
# 1) Should the program check for empty entries?
# 2) Should the program check for negative numbers?
# 3) Should the program check for zeros entered?
# 4) Should the program ask if the user wishes to do another calculation?
