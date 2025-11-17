require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:lazaro_nixon)
    post sign_in_url, params: { email: @user.email, password: "Secret1*3*5*" }
  end

  test "should get index" do
    get dashboard_url
    assert_response :success
  end
end
