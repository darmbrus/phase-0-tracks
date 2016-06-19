puts "What is the hamsters name?"
names = gets.chomp

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
