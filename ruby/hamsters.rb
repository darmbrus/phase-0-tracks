puts "What is the hamsters name?"
name = gets.chomp

puts "How would you rate the volume of the hamster? (1-10)"
volume = gets.chomp.to_i

puts "What is the color of the fur?"
fur_color = gets.chomp

puts "Is the hamster a good candidate for adoption? (yes / no)"
adoption = gets.chomp
if (adoption == "yes" || adoption == "y")
  adoption = true;
else
  adoption = false;
end

puts "What is their estimated age?"
age = gets.chomp.to_i
if (age == 0)
  age = nil
end


puts "The name of the hamster is: " + name
puts "The volume of the hamster is: " + volume.to_s
puts "The color of the fur on the hamster is: " + fur_color
puts "This hamster is a good candidate for adoption: " + adoption.to_s
puts "The estimated age of the hamster is: " + age.to_s
