ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rails/test_help'
FactoryGirl.find_definitions

require 'simplecov'
SimpleCov.start 'rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include FactoryGirl::Syntax::Methods
  
  def setup
     DatabaseCleaner.start
   end

   def teardown
     DatabaseCleaner.clean
   end   
  
  # Add more helper methods to be used by all tests here...
end
class ActionController::TestCase
  include Devise::TestHelpers
end
