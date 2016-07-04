require 'java'
require 'jdbc/sqlite3'

module SQLite3
  class Database
    module JavaSql
      include_package 'java.sql'
    end

    def self.open(path)
      self.new path
    end

    def initialize(path)
      Jdbc::SQLite3.load_driver
      Java::org.sqlite.JDBC

      conn_str = "jdbc:sqlite:#{File.join(path)}"
      @conn = JavaSql::DriverManager.getConnection(conn_str)
      @stm = @conn.createStatement
    end

    def execute(sql, arr=nil)
      rs = if arr.nil?
        @stm.executeQuery(sql)
      else
        @stm.executeQuery(sql, arr)
      end
      columns = []
      rsm = rs.getMetaData
      rsm.getColumnCount.times do |i|
        columns << rsm.getColumnName(i + 1)
      end
      data = []
      while (rs.next) do
        data << columns.map{|column|rs.getString(column)}
      end
      data
    ensure
      rs.close
    end

    def close
      @stm.close
      @conn.close
    end
  end
end
