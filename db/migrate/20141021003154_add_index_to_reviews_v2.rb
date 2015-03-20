class AddIndexToReviewsV2 < ActiveRecord::Migration
  def change
      add_column :reviews, :reviews_id, :integer
    add_column :reviews, :writings_id, :integer
  end
end
