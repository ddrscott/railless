$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

ENV['HARVEST_ENV'] ||= 'test'
ENV['RAILS_ENV'] ||= 'test'

require 'pry'
require 'rails'
require 'active_record/railtie'
ActiveRecord::Base.raise_in_transactional_callbacks = true

require 'rspec/rails'
require 'railless'
require_relative './config'

ActiveRecord::Migration.maintain_test_schema!
