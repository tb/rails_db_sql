# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rails_db_sql/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Tomasz Bak"]
  gem.email         = ["t.bak@selleo.com"]
  gem.description   = %q{Rake hooks that execute db/sql/*.sql after db:migrate / db:rollback / db:schema:load}
  gem.summary       = %q{Rake hooks that execute db/sql/*.sql after db:migrate / db:rollback / db:schema:load}
  gem.homepage      = "https://github.com/tb/rails_db_sql"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "rails_db_sql"
  gem.require_paths = ["lib"]
  gem.version       = RailsDbSql::VERSION

  gem.add_development_dependency "colored"
end
