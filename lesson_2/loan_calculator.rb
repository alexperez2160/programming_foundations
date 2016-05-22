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

apr_years= gets.chomp.to_f

quoted_rate=(apr_years*0.01)/12

puts "The monthly interest rate is #{quoted_rate}"

puts "What is the loan amount?"

amount= gets.chomp.to_f
puts "The loan amount is $#{amount}"

puts "What is the loan duration in years?"

duration=gets.chomp.to_i
duration= duration*12 

puts "The loan duration is #{duration} months."

payment = (amount*(quoted_rate*((1 + quoted_rate)**duration)))/(((1 + quoted_rate)**duration) - 1)

puts "Your monthly payment will be #{payment}."

puts "Do you have any other loans whose monthly payment you'd like to calculate?"

answer= gets.chomp

   break unless answer.downcase().start_with?('y')
        
end 
"Thank you for using the loan calculator"