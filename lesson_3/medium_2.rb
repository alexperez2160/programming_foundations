## Question 1 

# hash_age=[]
# munsters.each do |name, details| 
#   hash_age<< details["age"]
# end
 
# hash_age.reduce(:+)
# #or

# total_male_age = 0
# munsters.each do |name, details|
#   total_male_age += details["age"] if details["gender"] == "male"
# end

# Question 2 
munsters.each do |name, details| 
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}."
end
