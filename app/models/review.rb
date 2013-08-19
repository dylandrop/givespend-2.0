class Review < ActiveRecord::Base
  belongs_to :item
  belongs_to :user_who_received_review, class_name: User, foreign_key: :user_received_id
  belongs_to :user_who_gave_review, class_name: User, foreign_key: :user_given_id
  attr_accessible :description, :rating
end
