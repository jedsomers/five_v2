class AddQuestionsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :question2, :integer
    add_column :reviews, :question3, :integer
    add_column :reviews, :question4, :integer
    add_column :reviews, :question5, :integer
  end
end
