require 'sqlite3'

module DB_actions
  # Method to initialize the database and tables for project tracking
  # Returns the attached database
  def self.init_database
    db = SQLite3::Database.new('projects.db')
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS Projects (
        projId INTEGER PRIMARY KEY,
        projName VARCHAR(255),
        projComplete BOOLEAN
      );
    SQL
    db.execute(sql)
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS Tasks (
        taskId INTEGER PRIMARY KEY,
        taskName VARCHAR(255),
        taskComplete BOOLEAN,
        taskAssignment VARCHAR(255),
        projId INTEGER,
        FOREIGN KEY (projID) REFERENCES Projects(projID)
      );
    SQL
    db.execute(sql)
    return db
  end

  # Method to create a new project entry, assumes project is not complete
  # Input:
  #   db - the database to update
  #   name - the project names
  #   
  def self.add_project(db, name)
    db.execute("INSERT INTO Projects (projName, projComplete) VALUES (?, ?)", 
               [name, "false"])
  end


end
