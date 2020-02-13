require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

old_logger = ActiveRecord::Base.logger   #removes the sql info so user will not see
ActiveRecord::Base.logger = nil

require 'pry'
require_all 'lib'
require_all 'app'

