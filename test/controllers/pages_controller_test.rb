require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get suggest" do
    get :suggest
    assert_response :success
  end

end
