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
        taskStartDate VARCHAR(255),
        taskEndDate VARCHAR(255),
        taskComplete BOOLEAN,
        projId INTEGER,
        engId INTEGER,
        FOREIGN KEY (projId) REFERENCES Projects(projId),
        FOREIGN KEY (engId) REFERENCES Engineers(engId)
      );
    SQL
    db.execute(sql)
    if (db.execute("SELECT * FROM Engineers;") == [])
      sql = <<-SQL
       INSERT INTO Engineers (engName) VALUES ("UNASSIGNED");
      SQL
      db.execute(sql)
    end
    db.results_as_hash = true
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
  #   startDate - the start date for the task
  #   endDate - the end date of the task
  #   projId - the project id to link the task to
  #   engId - the engineer's id to link the task to (default = 1, or UNASSIGNED)
  def self.add_task(db, name, startDate, endDate, projId, engId = 1)
    db.execute("INSERT INTO Tasks (
               taskName,
               taskStartDate,
               taskEndDate,
               taskComplete,
               projId,
               engId
              ) VALUES (?, ?, ?, ?, ?, ?)", 
              [name, startDate, endDate, "false", projId,  engId])
  end

  # Method to print out all tasks for a defined project id
  # engineer
  # Input:
  #   db - the database to update
  #   projId - the project id
  def self.print_tasks(db, projId)
    max_length = 20
    tasks = db.execute("SELECT taskId, taskName, engName, taskComplete 
      FROM Tasks
      JOIN Engineers ON Tasks.engId = Engineers.engId
      WHERE projId = ?;", [projId])
    tasks.each { |task|
      if task['taskName'].length > max_length
        max_length = task['taskName'].length + 1
      end
    }
    if tasks.length != 0
      printf("%-4s | %-#{max_length.to_s}s | %-15s | %-5s\n",
             "ID".center(4, "-"),
             "Task Name".center(20,"-"),
             "Assignment".center(15,"-"),
             "Completed")
      tasks.each { |task|
        printf("%-4s | %-#{max_length.to_s}s | %-15s | %-5s\n",
              task['taskId'],
              task['taskName'],
              task['engName'],
              task['taskComplete'])
      }
    end
  end

  # Method to print out all projects in the database
  # 
  # Input:
  #   db - the database to update
  #   project_id - If 0 all projects will print, otherwise only the project
  #     for the specified ID will be printed
  #   print_tasks - If true the tasks will print with the project
  #     defaults to false
  #   print_complete - If true all projects including projects marked complete
  #     will print, default is false
  def self.print_projects(db,
                          project_id = 0,
                          print_all_tasks = false,
                          print_complete = false)
    if project_id == 0
      if print_complete
        proj = db.execute("SELECT * FROM Projects;")
      else
        proj = db.execute("SELECT * FROM Projects WHERE projComplete='false';")
      end
    else
      proj = db.execute("SELECT * FROM Projects WHERE projId = ?;",
                        [project_id])
    end
    proj.each { |project|
      printf("%-3d - %-20s\n", project["projId"], project["projName"])
      if print_all_tasks
        print_tasks(db, project["projId"])
      end
    }
  end

  # Method to print out all engineers
  # 
  # Input:
  #   db - the database to query
  def self.print_engineers(db)
    eng = db.execute("SELECT * FROM Engineers;")
    eng.each { |engineer|
      printf("%-3d - %-20s\n", engineer["engId"], engineer["engName"])
    }
  end

  # Method to reassign the engineer on a task
  #
  # Input:
  #   db - the database to update
  #   task_id - the id of the task to update
  #   eng_id - the engineer's id to assign to the task
  def self.assign_task_eng(db, task_id, eng_id)
    db.execute("UPDATE Tasks SET engId = ? WHERE taskId = ?;", eng_id, task_id)
  end

  # Method to mark a project complete
  #
  # Input:
  #   db - the database to update
  #   proj_id - id of the project to mark complete
  def self.set_proj_complete(db, proj_id)
    db.execute("UPDATE Projects SET projComplete = 'true' WHERE projId = ?;",
               proj_id)
  end

  # Method to mark a task complete
  #
  # Input:
  #   db - the database to update
  #   task_id - id of the project to mark complete
  def self.set_task_complete(db, task_id)
    db.execute("UPDATE Tasks SET taskComplete = 'true' WHERE taskId = ?;",
               task_id)
  end
end
