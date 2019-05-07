require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite'
)

# ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger = nil

require_all 'app'
