require 'sqlite3'

module DB_actions
  def self.init_database
    db = SQLite3::Database.new('test')
  end



end
