require 'test_helper'

class PizzaLocationsControllerTest < ActionController::TestCase

  test "show" do 
    location = create(:pizza_location)
    get :show , :id => location.id
    assert_response :success
    assert_not_nil assigns(:pizza_location)
  end
  
  test "nearby" do
    get :nearby, :search => "Hyderabad India"
    assert_response :success
    assert_not_nil assigns(:pizza_locations)
  end
  
  test "edit admin only" do
    location = create(:pizza_location)
    user = create(:user)
    user.admin = true
    user.save
    sign_in user
    get :edit, :id => location.id
    assert_response :success
    assert_not_nil assigns(:pizza_location)        
  end
  
  test "edit non-admin" do
    location = create(:pizza_location)
    user = create(:user)
    sign_in user
    get :edit, :id => location.id
    assert_response :redirect
  end
  
end
