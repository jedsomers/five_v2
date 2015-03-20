require 'test_helper'

class BasicPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Five"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | Five"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Five"
  end

end
