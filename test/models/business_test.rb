require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  
  def setup
    @business = Business.new(name: "Arbys", longitude: 45.0, latitude: 45.0)
  end
  
  test "micropost should be valid" do
    assert @business.valid?
  end
  
  test "business name should be present" do
    @business.name = " "
    assert_not @business.valid?
  end
  
  test "business name should be at most 75 characters" do
    @business.name = "a" * 76
    assert_not @business.valid?
  end
  
  test "name should be unique across locations" do
    duplicate_business = @business.dup
    @business.save
    assert_not duplicate_business.valid?
  end
   
end
