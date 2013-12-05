require "rails_db_sql/version"

module RailsDbSql

  require "rails_db_sql/railtie" if defined?(Rails::Railtie)

  def self.reload(pattern="db/sql/**/*.sql")
    Dir.glob(pattern).sort.each do |path|
      File.open path, "r" do |file|
        execute_sql file.read
      end
    end
  end

  private

  def self.execute_sql(sql)
    ActiveRecord::Base.connection.execute sql
  end

end
