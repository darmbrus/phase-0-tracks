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
  puts "5  - Complete project"
  print "Selection: "
end

def print_task_submenu()
  puts "----------------------------------------------------------------------"
  puts "0  - Return to main menu"
  puts "1  - Select a project"
  puts "2  - Print current project tasks"
  puts "3  - Add task"
  puts "4  - Reassign task"
  puts "5  - Complete task"
  print "Selection: "
end

db = nil
system "clear"
choice = 0
print_main_menu()
choice = gets.chomp.to_i
cur_proj_id = 0
db = DB_actions.init_database()
 
begin
  case choice
  when -1
    system "clear"
    print_main_menu()
  # Database submenu
  when 1
    begin
      print_database_submenu()
      choice = gets.chomp.to_i
      case choice
      when -1
         system "clear"
         print_database_submenu()
      # Connect to a database
      when 1
        system "clear"
        db = DB_actions.init_database()
      end
    end until choice == 0
  # Engineer submenu
  when 2
    begin
      print_engineer_submenu()
      choice = gets.chomp.to_i
      case choice
      # Print engineers
      when 1
        DB_actions.print_engineers(db)
      # Add engineer
      when 2
        name = gets.chomp
        DB_actions.add_engineer(db, name)
      end
    end until choice == 0
  # Project submenu
  when 3
    begin
      print_project_submenu()
      choice = gets.chomp.to_i
      case choice
      # Print all projects
      when 1
        DB_actions.print_projects(db, 0, false, true)
      # Print open projects
      when 2
        DB_actions.print_projects(db)
      # Add project
      when 3
        print "Please enter the new project name: "
        name = gets.chomp
        DB_actions.add_project(db, name)
      # Complete a project
      when 4
        DB_actions.print_projects(db)
        print "Please enter the project Id to complete: "
        proj_id = gets.chomp.to_i
        DB_actions.set_proj_complete(db, proj_id)
      end
    end until choice == 0
  # Task submenu
  when 4
    begin
      if cur_proj_id == 0
        puts "Please select a project: "
        DB_actions.print_projects(db, 0, false, true)
        cur_proj_id = gets.chomp
      end
      puts "Selected project:"
      DB_actions.print_projects(db, cur_proj_id, false, true)
      print_task_submenu()
      choice = gets.chomp.to_i
      case choice
      # Select a project
      when 1
        DB_actions.print_projects(db, 0, false, true)
        print "Please select a project: "
        cur_proj_id = gets.chomp
      # Print current project tasks
      when 2
        DB_actions.print_projects(db, cur_proj_id, true, true)
      # Add a task
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
      # Reassign task
      when 4
        DB_actions.print_tasks(db, cur_proj_id)
        print "Please select a task id: "
        task_id = gets.chomp.to_i
        DB_actions.print_engineers(db)
        print "Please select an engineer id: "
        eng_id = gets.chomp.to_i
        DB_actions.assign_task_eng(db, task_id, eng_id)
      # Complete a task
      when 5
        DB_actions.print_tasks(db, cur_proj_id)
        print "Please select a task to complete: "
        task_id = gets.chomp.to_i
        DB_actions.set_task_complete(db, task_id)
      end
    end until choice == 0
  end
  print_main_menu()
  choice = gets.chomp.to_i
end until choice == 0 
