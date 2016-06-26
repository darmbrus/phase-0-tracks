# data:
#   Clients name
#   age/
#   number of children
#   decor theme
#   number of rooms
#   favorite color
#   adventurous
# define a blank hash
# prompt for all of the data and place in to the hash
# display the data
# ask the user if there is anything they would like to change
# if they enter a key
#   enter the new data
# display the update_field


# Initialize the client hash
client = {
  name: "",
  age: 0,
  number_of_children: 0,
  decor_theme: "",
  number_of_rooms: 0,
  favorite_color: "",
  adventurous: false,
}
puts "Please enter your name: "
client[:name] = gets.chomp
puts "Please enter your age: "
client[:age] = gets.to_i
puts "How many children do you have: "
client[:number_of_children] = gets.to_i
puts "What would you like the theme to be: "
client[:decor_theme] = gets.chomp
puts "How many rooms does the space have: "
client[:number_of_rooms] = gets.to_i
puts "What is your favorite color: "
client[:favorite_color] = gets.chomp
puts "Are you feeling adventurous: "
adventurous_answer = gets.chomp
# Parse adventurous answer
if adventurous_answer == "true"
  client[:adventurous] = true
else
  client[:adventurous] = false
end
puts client
puts "Would you like to update any of the fields: "
update_field = gets.chomp
if update_field != "done"
  update_field.prepend(":")
  puts "Please enter the value you would like to update it to: "
  update_value = gets.chomp
  # need to check all possible values of update_field and convert to the correct type
  if update_field = ":name" || update_field = ":decor_theme" || update_field = ":favorite_color"
    client[update_field] = update_value
  elsif update_field = ":number_of_children" || update_field = "number_of_rooms"
    client[update_field] = update_value.to_i
  elsif update_field = ":adventurous_answer"
    if update_value == "true"
      client[:adventurous] = true
    else
      client[:adventurous] = false
    end
  else
    puts "No value updated"
  end
  puts client


end
