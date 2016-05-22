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

loop do 
puts "What is the APR of the loan?"

apr= gets.chomp.to_f

quoted_rate=(apr*0.01)/12

puts "The monthly interest rate is #{quoted_rate}"

puts "What is the loan amount?"

amount= gets.chomp.to_f
puts "The loan amount is $#{amount}"

puts "What is the loan duration in years?"

duration_years=gets.chomp.to_i
duration_months= duration_years*12 

puts "The loan duration is #{duration_months} months."

monthly_payment = (amount*(quoted_rate*((1 + quoted_rate)**duration_months)))/(((1 + quoted_rate)**duration_months) - 1)

puts "Your monthly payment will be #{monthly_payment}."

puts "Do you have any other loans whose monthly payment you'd like to calculate?"

answer= gets.chomp

   break unless answer.downcase().start_with?('y')
        
end 
puts "Thank you for using the loan calculator"