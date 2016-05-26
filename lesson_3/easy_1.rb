## Question 1

# numbers = [1, 2, 2, 3]
# numbers.uniq

# puts numbers

## numbers unique prints the unique numbers 
## puts will print the original array

## Question 2 

## some methods with the ! will mutate the original values; the ? checks the values within an object. 

### 1. != is does not equal. It should be used in conditionals 

## 2. 
# !user_name = "aleperez"
## You get an error saying that found = in conditional 

## 3. The ! after a method usually means that it's gonna mutate the caller
#   words = ["Me", "You", "Me", "Him"]
#   # words.uniq!
#   # puts words

## 4. You get an error that says unexpected ?.
#   # ?user_name= 'aleperez'

## 5. You get an error when you put it next to a set method like unique. 
#   # words.uniq?
#   # words?= ["Me", "You", "Me", "Him"]
  
## 6 It gives you an error saying that it found a conditional.
#   !!user_name= "Aleperez"

# Question 3 

# advice.gsub("important", "urgent")

##Question 4

# The first method deletes the value at position 1 
# The second method deletes the value '1' 

# Question 5
### 42.between?(10,100)
# (10...100).cover?(42)

# Question 6

# famous_words.prepend("Four score and ")

# "Four score and" + famous_words

# Question 7

# the output says 42

# Question 8 

# flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
# flintstones.flatten!
# puts flintstones

# Question 9 
# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
# flintstones.keep_if{|key, value| key == "Barney"}

# Question 10
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# flintstones_hash = {}
# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end
