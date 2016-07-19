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
      CREATE TABLE IF NOT EXISTS Engineers (
        engId INTEGER PRIMARY KEY,
        engName VARCHAR(255)
      );
    SQL
    db.execute(sql)
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS Tasks (
        taskId INTEGER PRIMARY KEY,
        taskName VARCHAR(255),
        taskComplete BOOLEAN,
        projId INTEGER,
        engId INTEGER,
        FOREIGN KEY (projId) REFERENCES Projects(projId),
        FOREIGN KEY (engId) REFERENCES Engineers(engId)
      );
    SQL
    db.execute(sql)
    return db
  end

  # Method to create a new project entry, assumes project is not complete
  # Input:
  #   db - the database to update
  #   name - the project name
  def self.add_project(db, name)
    db.execute("INSERT INTO Projects (projName, projComplete) VALUES (?, ?)", 
               [name, "false"])
  end

  # Method to create a new engineer
  # Input:
  #   db - the database to update
  #   name - the engineer name
  def self.add_engineer(db, name)
    db.execute("INSERT INTO Engineers (engName) VALUES (?)", 
               [name])
  end

  # Method to create a new task and assign it to a project and optional 
  # engineer
  # Input:
  #   db - the database to update
  #   name - the task name
  def self.add_task(db, name, projId, engId)
    db.execute("INSERT INTO Tasks (
               taskName,
               projId,
               engId
              ) VALUES (?, ?, ?)", 
               [name, projId,  engId])
  end
end
