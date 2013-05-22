require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get remove" do
    get :remove
    assert_response :success
  end

  test "should get checkout" do
    get :checkout
    assert_response :success
  end

end
