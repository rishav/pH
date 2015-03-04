require 'test_helper'

class PizzaLocationsControllerTest < ActionController::TestCase
  def sign_in_admin
    user = create(:user)
    user.admin = true
    user.save
    sign_in user
  end
  
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
    sign_in_admin
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
  
  test "near you with longitude and latitude" do
    get :nearyou, :latitude => 17.44, :longitude => 18.3
    assert_response :success
  end
  
  test "create does not allow unpermitted params" do
    location = build(:pizza_location)
    sign_in_admin
    post :create, pizza_location: { name: location.name, address: location.address, city: location.city, zipcode: location.zipcode, country: location.country, featured: true}
    assert_not assigns(:pizza_location).featured    
  end
  
  test "create" do
    location = build(:pizza_location)
    sign_in_admin
    assert_difference 'PizzaLocation.count', 1 do 
      post :create, pizza_location: { name: location.name, address: location.address, city: location.city, zipcode: location.zipcode, country: location.country}
    end
    assert_response :redirect
  end
  
  test "create with no save" do
    location = build(:pizza_location)
    sign_in_admin
    assert_difference 'PizzaLocation.count', 0 do 
      post :create, pizza_location: { name: '', address: location.address, city: location.city, zipcode: location.zipcode, country: location.country}
    end
    assert_response :success
    assert_template "new"    
  end
  
  
  test "update" do
    location = create(:pizza_location)
    sign_in_admin
    put :update, pizza_location: { name: 'Test'}, id: location.id
    assert assigns(:pizza_location).name == 'Test'
  end
  
  test "update no save" do
    location = create(:pizza_location)
    sign_in_admin
    put :update, pizza_location: { name: ''}, id: location.id
    assert_template "edit"    
  end
  
  test "new" do
    user = create(:user)
    sign_in_admin
    get :new
    assert_response :success    
  end    
  
  test "update does not allow unpermitted params" do
    location = create(:pizza_location)
    sign_in_admin
    put :update, pizza_location: { featured: true}, id: location.id
    assert_not_nil assigns(:pizza_location)
  end
    
end
