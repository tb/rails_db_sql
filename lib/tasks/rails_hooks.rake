%w[db:migrate db:rollback db:schema:load].each do |task_name|
  task task_name => %w[environment db:load_config] do
    RailsDbSql.reload
  end
end