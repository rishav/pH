require 'test_helper'

class SiteControllerTest < ActionController::TestCase

  test "should index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:featured_locations)
  end
  
end
