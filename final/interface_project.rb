require_relative 'database'

def print_main_menu()
  puts "----------------------------------------------------------------------"
  puts "Welcome to the ruby project handler v.1"
  puts "Please select an option below:"
  puts "1  - Database Manager"
  puts "2  - Engineer Manager"
  puts "3  - Project Manager"
  puts "4  - Task Manager"
  print "Selection: "
end

def print_database_submenu()
  puts "----------------------------------------------------------------------"
  puts "0  - Return to main menu"
  puts "1  - Connect to a database"
  print "Selection: "
end

def print_engineer_submenu()
  puts "----------------------------------------------------------------------"
  puts "0  - Return to main menu"
  puts "1  - List engineers"
  puts "2  - Add an engineer"
  print "Selection: "
end

def print_project_submenu()
  puts "----------------------------------------------------------------------"
  puts "0  - Return to main menu"
  puts "1  - Print all projects"
  puts "2  - Print open projects"
  puts "3  - Add project"
  print "Selection: "
end

def print_task_submenu()
  puts "----------------------------------------------------------------------"
  puts "0  - Return to main menu"
  puts "1  - Select a project"
  puts "2  - Print current project tasks"
  puts "3  - Add task"
  puts "4  - Reassign task"
  print "Selection: "
end

db = nil
system "clear"
choice = 0
print_main_menu()
choice = gets.chomp.to_i
cur_proj_id = 0
 
begin
  case choice
  when -1
    system "clear"
    print_main_menu()
  when 1
    begin
      print_database_submenu()
      choice = gets.chomp.to_i
      case choice
      when -1
         system "clear"
         print_database_submenu()
      when 1
        system "clear"
        db = DB_actions.init_database()
      end
    end until choice == 0
  when 2
    begin
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
  when 3
    begin
      print_project_submenu()
      choice = gets.chomp.to_i
      case choice
      when 1
        DB_actions.print_projects(db, 0, false, true)
      when 2
        DB_actions.print_projects(db)
      when 3
        print "Please enter the new project name"
        name = gets.chomp
        DB_actions.add_project(db, name)
      end
    end until choice == 0
  when 4
    begin
      if cur_proj_id == 0
        puts "Please select a project:"
        DB_actions.print_projects(db, 0, false, true)
        cur_proj_id = gets.chomp
      end
      puts "Selected project:"
      DB_actions.print_projects(db, cur_proj_id, false, true)
      print_task_submenu()
      choice = gets.chomp.to_i
      case choice
      when 1
        DB_actions.print_projects(db, 0, false, true)
        print "Please select a project ID"
        cur_proj_id = gets.chomp
      when 2
        DB_actions.print_projects(db, cur_proj_id, true, true)
      when 3
        print "Task name: "
        name = gets.chomp
        print "Task start date (MM/DD/YYY): "
        start_date = gets.chomp
        print "Task end date (MM/DD/YYY): "
        end_date = gets.chomp
        DB_actions.print_engineers(db)
        print "Engineer assignment: "
        eng = gets.chomp.to_i
        DB_actions.add_task(db, name, start_date, end_date, cur_proj_id, eng)
      when 4
        DB_actions.print_tasks(db, cur_proj_id)
        print "Please select a task id: "
        task_id = gets.chomp.to_i
        DB_actions.print_engineers(db)
        print "Please select an engineer id: "
        eng_id = gets.chomp.to_i
        DB_actions.assign_task_eng(db, task_id, eng_id)
      end
    end until choice == 0
  end
  print_main_menu()
  choice = gets.chomp.to_i
end until choice == 0 
