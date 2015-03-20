require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:jed)
    @review = @user.reviews.build(content: "he was ok", rating: 4)
    @review.reviewee_id = 1
    @review.writer_id = 2
    #@review = @user.re.build(content: "he was ok", rating: 4)
  end
  
  test "review should be valid" do
    assert @review.valid?
  end
  
  test "user id should be present" do
    @review.writer_id = nil
    @review.reviewee_id = nil
    assert_not @review.valid?
  end
  
  test "order should be most recent first" do
    assert_equal Review.first, reviews(:most_recent)
  end
  
  test "rating should be present" do
    @review.rating = " "
    assert_not @review.valid?
  end
  
  
end
