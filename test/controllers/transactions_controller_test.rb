require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:lazaro_nixon)
    @property = properties(:one)
    @transaction = transactions(:one)
    post sign_in_url, params: { email: @user.email, password: "Secret1*3*5*" }
  end

  test "should get index" do
    get property_transactions_url(@property)
    assert_response :success
  end

  test "should get new" do
    get new_property_transaction_url(@property)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_transaction_url(@property, @transaction)
    assert_response :success
  end
end
