# Question 1 

#10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

# Question 2 

# letter_freq= {}
# statement = "The Flintstones Rock"
# statement.each_char {|x| letter_freq[x]= statement.count(x)}
# #or 
# #
# result = {}
# letters = ('A'..'Z').to_a + ('a'..'z').to_a
# letters.each do |letter|
#   letter_frequency = statement.scan(letter).count
#   result[letter] = letter_frequency if letter_frequency > 0
# end

#Question 3
#It gives you an error because the command is trying to add a string to 40+2
 #puts "the value of 40 + 2 is  #{(40 + 2)}"
 
 # Question 5 
 
# def factors(number)
#   dividend = number
#   divisors = []
#   if number > 0 
#     while dividend > 0 do 
#       divisors << number / dividend if number % dividend == 0
#       dividend -= 1
#     end
#     divisors
#   else 
#   puts "Invalid number"
#   end

# Question 7

# def fib(first_num, second_num, limit)
#   while second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# Question 8
# def titalize(phrase)
#   phrase.to_s
#   new_phrase =[]
#   sep_phrase = phrase.split(' ')
#   sep_phrase.each {|word| new_phrase << word.capitalize }
#   puts new_phrase.join(" ")
# end 

  
