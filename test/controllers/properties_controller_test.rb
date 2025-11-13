require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:lazaro_nixon)
    @property = properties(:one)
    post sign_in_url, params: { email: @user.email, password: "Secret1*3*5*" }
  end

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get show" do
    get property_url(@property)
    assert_response :success
  end

  test "should get new" do
    get new_property_url
    assert_response :success
  end

  test "should get edit" do
    get edit_property_url(@property)
    assert_response :success
  end
end
