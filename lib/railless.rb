# Set up default ENV values
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
ENV['RAILLESS_ENV'] ||= 'development'

# Bundler stuff
require 'rubygems'
require 'bundler'
Bundler.setup(:default, ENV['RAILLESS_ENV'])

require 'active_record'
require 'active_job'
require 'yaml'
require 'logger'

# This projects' stuff
require "railless/version"

module Railless

  # Use like `Rails.env.development?`
  # @return [ActiveSupport::StringInquirer]
  def self.env
    ActiveSupport::StringInquirer.new(ENV['RAILLESS_ENV'])
  end

  # Use like `Rails.root`
  # @return [Pathname]
  def self.root
    Pathname(File.absolute_path(File.join(File.dirname(__FILE__), '..')))
  end
end
