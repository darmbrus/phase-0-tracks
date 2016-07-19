require_relative 'database'
require 'sqlite3'

db = DB_actions.init_database
puts "creating project"
DB_actions.add_project(db, "test")
puts "creating engineer"
DB_actions.add_engineer(db, "David")
puts "creating task"
DB_actions.add_task(db, "test task 1", 1, 2)
DB_actions.add_task(db, "test task 2", 1)
