# Lesson 3 Excercises-> Hard Questions

#Quesiton 1 
# if false
#   greeting = “hello world”
# end

# greeting

# # Answer: I would expect an error error

# #Question 2 
# #Answer: I would expect it to throw the original has with only "hi"

# Question 4

# def generate_UUID
#   characters = [] 
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |digit| characters << digit }

#   uuid = ""
#   sections = [8, 4, 4, 4, 12]
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.size - 1
#   end

#   uuid
# end

# Question 5 
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  dot_separated_words_check=[]
  if dot_separated_words.size == 4 
    dot_separated_words.each { |num| dot_separated_words_check<< Integer(num) rescue nil}
  end
  puts dot_separated_words_check
end


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end
