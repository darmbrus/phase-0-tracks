require_relative 'database'
require 'sqlite3'

db = DB_actions.init_database

DB_actions.add_project(db, "test", 12.343)
