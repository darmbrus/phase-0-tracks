require 'sqlite3'

module DB_actions
  def self.init_database
    db = SQLite3::Database.new('projects.db')
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS Projects (
        projId INTEGER PRIMARY KEY,
        projName VARCHAR(255),
        projValue DOUBLE(9,2)
      );
    SQL
    db.execute(sql)
    return db
  end

  def self.add_project(db, name, value)
    db.execute("INSERT INTO Projects (projName, projValue) VALUES (?, ?)", [name, value])
  end

end
