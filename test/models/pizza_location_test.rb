require 'test_helper'

class PizzaLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should validate_presence_of(:name)
  should validate_presence_of(:address)
  should validate_presence_of(:city)
  should validate_presence_of(:zipcode)
  should validate_presence_of(:country)
  should have_many(:photos)
  should have_one(:primary_photo)
    
  test "should geocode address and store lat and long" do
    pizza_location = create(:pizza_location)
    assert pizza_location.latitude.to_i == 17
  end
  
  test "sets featured_at when featured " do
    pizza_location = create(:pizza_location)
    pizza_location.feature!
    assert pizza_location.featured
    assert_not_nil pizza_location.featured_at    
  end
  
end
