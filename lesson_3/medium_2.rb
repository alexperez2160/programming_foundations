# ## Question 1 

# # hash_age=[]
# # munsters.each do |name, details| 
# #   hash_age<< details["age"]
# # end
 
# # hash_age.reduce(:+)
# # #or

# # total_male_age = 0
# # munsters.each do |name, details|
# #   total_male_age += details["age"] if details["gender"] == "male"
# # end

# # Question 2 
# # munsters.each do |name, details| 
# #   puts "#{name} is a #{details["age"]} year old #{details["gender"]}."
# # end

# # Question 3 
# # def tricky_method(a_string_param, an_array_param)
# #   a_string_param += "rutabaga" 
# #   an_array_param << ["rutabaga"]
  
# #   return a_string_param, an_array_param
# # end

# # my_string = "pumpkins"
# # my_array = ["pumpkins"]
# # my_string, my_array = not_so_tricky_method(my_string, my_array)

# # puts "My string looks like this now: #{my_string}"
# # puts "My array looks like this now: #{my_array}"

# # Question 4
# # sentence.split.reverse.join(' ')

# # Question 6 

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# def mess_with_demographics(demo_hash)
#   demo_hash.values.each do |family_member|
#     family_member["age"] += 42
#     family_member["gender"] = "other"
#   end
# end

# # Answer: It seems to have manipulated the original hash. This might be because the method is using the actual 
# # munsters hash and not reassigning it
