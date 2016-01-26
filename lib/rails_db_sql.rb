require "rails_db_sql/version"

module RailsDbSql

  require "rails_db_sql/railtie" if defined?(Rails::Railtie)

  def self.reload(pattern="db/sql/**/*.sql")
    errors = {}
    Dir.glob(pattern).sort.each do |path|
      File.open path, "r" do |file|
        puts "RailsDbSql: executing #{path}"
        begin
         execute_sql file.read
        rescue => e
          errors[path] = e.to_s
        end
      end
    end
    unless errors.empty?
      errors.each_with_index do |(path,details),index|
        puts "\n#{index+1}) Error in #{path}"
        puts "\n#{details}\n"
      end
      puts "RailsDbSql: #{errors.size} errors"
    end
  end

  private

  def self.execute_sql(sql)
    ActiveRecord::Base.connection.execute sql
  end

end
