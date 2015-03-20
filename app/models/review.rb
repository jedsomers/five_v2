class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :writer, class_name: "User"
  belongs_to :reviewee, class_name: "User"
  default_scope -> { order('created_at DESC') }
  #validates :user_id, presence: true
  validates :rating, presence: true, numericality: true
  #validates :writer_id, presence: true
  validates :reviewee_id, presence: true
end
