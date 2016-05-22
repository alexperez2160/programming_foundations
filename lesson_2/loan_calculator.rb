# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration
##P = L[c(1 + c)n]/[(1 + c)n - 1]

# monthly interest rate
# loan duration in months

##pseudo code 
### get the APR from the user
## make sure it's in float 
### divide that by 12 to get the monthly 
###  get the loan amount 
## get the loan duration 
## specify if it's in years or months
## convert to month if not in months 
## plug into the formula 

puts "Hello, what's your name?"

name= gets.chomp 

puts "Hello #{name}. Let me help you calculate your monthly loan payment"

puts "What is the APR of the loan?"

apr= gets.chomp.to_f

quoted_rate=(apr*0.01)/12

puts "What is the loan amount?"

amount= gets.chomp.to_f

puts "What is the loan duration in months?"

duration=gets.chomp.to_i

payment = (amount*(quoted_rate*((1 + quoted_rate)**duration)))/(((1 + quoted_rate)**duration) - 1)

puts "Your monthly payment will be #{payment}."

