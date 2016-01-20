namespace :db do
  task :environment do
    require 'railless'

    db_config = YAML::load(File.open(Railless.root.join('config', 'database.yml')))
    ActiveRecord::Base.establish_connection(db_config[Railless.env])
    ActiveRecord::Base.logger = Logger.new(File.open(Railless.root.join('log', 'database.log'), 'a'))
  end

  desc 'Migrate the database through scripts in db/migrate. Target specific version with VERSION=x'
  task :migrate => :environment do
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate('db/migrate', ENV['VERSION'] && ENV['VERSION'].to_i)
  end
  task :rollback => :environment do
    ActiveRecord::Migration.verbose = true
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Migrator.rollback('db/migrate', step)
  end
end

