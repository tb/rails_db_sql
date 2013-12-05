require "rails_db_sql"
require "rails"

module RailsDbSql
  class Railtie < Rails::Railtie
    railtie_name :rails_db_sql

    rake_tasks do
      load "tasks/rails_hooks.rake"
    end
  end
end
