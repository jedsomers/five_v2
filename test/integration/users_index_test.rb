require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jed)
  end
  
  test "index" do
    log_in_as(@user)
    get users_path
  end

end
