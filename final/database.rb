require 'sqlite3'

module DB_actions
  def self.init_database
    db = SQLite3::Database.new('projects.db')
    sql = <<-SQL
      CREATE TABLE Projects (
        projId INTEGER PRIMARY KEY,
        projName VARCHAR(255),
        projValue DOUBLE(9,2)
      );
    SQL
    db.execute(sql)
  end



end
