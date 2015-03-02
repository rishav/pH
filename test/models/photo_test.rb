require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  should belong_to(:pizza_location)
    
end
