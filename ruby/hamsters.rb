puts "What is the hamsters name?"
names = gets.chomp

puts "How would you rate the volume of the hamster? (1-10)"
volume = gets.chomp

puts "What is the color of the fur?"
fur_color = gets.chomp

puts "Is the hamster a good candidate for adoption? (yes / no)"
adoption = gets.chomp

puts "What is their estimated age?"
age = gets.chomp

if (age == "")
  age = nil
end
