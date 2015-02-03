require 'minitest/autorun'
require 'rack/test'
require 'httparty'
require 'json'
require 'pry'
require 'mocha/setup'
require 'active_record'
require 'database_cleaner'

require_relative '../movie'
require_relative '../movie_app'
# require_relative '../test/movie_app_test'
# require_relative '../test/movie_test.rb'

class MiniTest::Test
  #include active_record
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3',
      :database => 'db/test.db'
    )

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end