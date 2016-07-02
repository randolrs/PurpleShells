require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: { address_city: @location.address_city, address_postal_code: @location.address_postal_code, address_state_or_province: @location.address_state_or_province, address_street: @location.address_street, country: @location.country, name: @location.name, student_capacity: @location.student_capacity }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  test "should update location" do
    patch :update, id: @location, location: { address_city: @location.address_city, address_postal_code: @location.address_postal_code, address_state_or_province: @location.address_state_or_province, address_street: @location.address_street, country: @location.country, name: @location.name, student_capacity: @location.student_capacity }
    assert_redirected_to location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location
    end

    assert_redirected_to locations_path
  end
end
