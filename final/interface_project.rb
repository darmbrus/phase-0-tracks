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

  print "Selection: "
end

def print_database_submenu()
  puts "0  - Return to main menu"
  puts "1  - Connect to a database"
  print "Selection: "
end

def print_engineer_submenu()
  puts "0  - Return to main menu"
  puts "1  - List engineers"
  puts "2  - Add an engineer"

  print "Selection: "
end

db = nil
system "clear"
choice = 0
print_main_menu()
choice = gets.chomp.to_i
 
begin
  case choice
  when 1
    begin
      puts "sub 1"
      print_database_submenu()
      choice = gets.chomp.to_i
      case choice
      when -1
         system "clear"
         print_main_menu()
      when 1
        system "clear"
        print_main_menu()
        db = DB_actions.init_database()
      end
    end until choice == 0

  when 2
    begin
      puts "sub 2"
      print_engineer_submenu()
      choice = gets.chomp.to_i
      case choice
      when 1
        DB_actions.print_engineers(db)
      when 2
        name = gets.chomp
        DB_actions.add_engineer(db, name)
      end
    end until choice == 0
  end

  print_main_menu()
  choice = gets.chomp.to_i
end until choice == 0 
