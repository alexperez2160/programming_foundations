# the loan amount
# the Annual Percentage Rate (APR)
# the loan duration
## P = L[c(1 + c)n]/[(1 + c)n - 1]

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

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("Hello, what's your name?")

name = gets.chomp
 
prompt("Hello #{name}. Let me help you calculate your monthly loan payment")

loop do
prompt("What is the APR of the loan?")
prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
apr =''

loop do
  apr = gets.chomp
    if apr.empty? || apr.to_f < 0
      prompt("Enter a valid number")
    else 
      break
    end
end 

quoted_rate = (apr.to_f * 0.01) / 12
prompt("The quoted rate is #{quoted_rate}")

prompt("What is the loan amount?")

amount = ''

loop do 
  amount = gets.chomp
    if amount.to_f < 0 || amount.empty?
        prompt("Please enter a correct loan amount")
    else 
      break
    end
end
    
prompt("The loan amount is $#{amount}")


puts "What is the loan duration in years?"

duration_years = ''
loop do 
    
duration_years = gets.chomp
  if duration_years.empty? || duration_years.to_i < 0
      prompt("Please enter a valid number")
  else
    break
  end
end

duration_months = duration_years.to_i * 12 

puts "The loan duration is #{duration_months} months."

monthly_payment = (amount.to_f * (quoted_rate * ((1 + quoted_rate)**duration_months))) / (((1 + quoted_rate)**duration_months) - 1)

puts "Your monthly payment will be #{monthly_payment}."

puts "Do you have any other loans 
whose monthly payment you'd like to calculate?"

answer = gets.chomp

  break unless answer.downcase().start_with?('y')
        
end 
puts "Thank you for using the loan calculator"