class AddIndexToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewee_id, :integer
    add_column :reviews, :writer_id, :integer
  end
end
