require_relative 'database'
require 'sqlite3'

db = DB_actions.init_database
puts "creating project"
DB_actions.add_project(db, "test")
puts "creating engineer"
DB_actions.add_engineer(db, "David")
puts "creating task"
DB_actions.add_task(db, "test task 1", Date.today.to_s, 1, 2)
# DB_actions.add_task(db, "test task 2", 1)

DB_actions.print_tasks(db, 1)
puts "print all projects"
DB_actions.print_projects(db, 0, true)
puts "print project 1"
DB_actions.print_projects(db, 1, true)
DB_actions.print_engineers(db)
