require_relative 'database'

choice = 0
system "clear"
puts "Welcome to the ruby project handler v.1"
puts "Please select an option below:"
puts "1  - Connect to a database"
puts "2  - Print current projects"
puts "3  - Print engineers"

print "Selection: "
choice = gets.chomp.to_i
