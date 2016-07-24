require_relative 'database'

def print_main_menu()
  puts "Welcome to the ruby project handler v.1"
  puts "Please select an option below:"
  puts "1  - Connect to a database"
  puts "2  - Print current projects"
  puts "3  - Print single project"
  puts "4  - Print engineers"
  puts "5  - Add project"
  puts "6  - Add Task"

end


db = nil
system "clear"
choice = 0
 
loop do
  print "Selection: "
  print_main_menu()
  choice = gets.chomp.to_i
  puts choice
  case choice
  when -1
    system "clear"
  when 1
    system "clear"
    db = DB_actions.init_database()
  when 2
    system "clear"
    DB_actions.print_projects(db)
  end
  break if choice == 0
end  
