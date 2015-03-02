require 'test_helper'

class PizzaLocationsControllerTest < ActionController::TestCase

  test "show" do 
    get :show 
    assert_response :success
    assert_not_nil assigns(:pizza_location)
  end
  
  test "nearby" do
    get :nearty
    assert_response :success
    assert_not_nil assigns(:pizza_locations)
  end
  
end
