require 'logger'

db_config = YAML::load_file(File.join('config', 'database.yml'))
ActiveRecord::Base.establish_connection(db_config[Railless.env])
ActiveRecord::Base.logger = Logger.new('log', "#{Railless.env}.log")

