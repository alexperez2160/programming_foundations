## ask the user for two numbers
### ask the user for an operation to perform 
### perform the operation on the two numbers 
##ouput the results 

# answer= gets
# puts answer 

LANGUAGE = 'sp'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')


def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)   # make sure the "messages" method is declared above this line
  Kernel.puts("=> #{message}")
end

def num?(input)
    integer?(input) || float?(input)
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def operation_to_message(operation)
  word = case operation
           when '1'
             'Adding'
           when '2'
             'Subtracting'
           when '3'
             'Multiplying'
           when '4'
             'Dividing'
         end

  x = "A random line of code"

  word
end

    
prompt('welcome')

name=''
loop do 
    name=gets.chomp
    if name.empty?()
        prompt('valid_name')
    else 
        break
    end 
end

puts ("Hi #{name}")

loop do 
number1=''
loop do 
prompt('first_number')
number1= gets.chomp
    if num?(number1)
        break
    else
        prompt('invalid_number')
    end
  end  
 
 number2=''

loop do 
puts "The number is #{number1}"
prompt('second_number')
number2= gets.chomp 
    if num?(number2)
        break
    else
        prompt ('invalid_number')
    end
end

    
puts "The number is #{number2}"

operator_prompt= <<-MSG
    What operation would you like to perform? 
    1) add 
    2) subtract 
    3) multiply 
    4)divide
    MSG

puts (operator_prompt)

operation=''
loop do 
operation= gets.chomp

    if %w(1 2 3 4).include?(operation)
        break 
    else 
        prompt("Please enter a valid operator")
    end 
end 

prompt("#{operation_to_message(operation)} the two numbers")

result=case operation
    when '1'
        number1.to_i+number2.to_i
    when '2'
        number1.to_i-number2.to_i
    when '3'
        number1.to_i * number2.to_i
    when '4'
        result=number1.to_f / number2.to_f
  end 
    
puts ( "The result is #{result}." )

puts ("Do you want to perform another calculation? (Y to calculate again)")

answer= gets.chomp
break unless answer.downcase().start_with?('y')

end 

prompt("Thank you for using the calculator ")