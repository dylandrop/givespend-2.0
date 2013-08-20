class Review < ActiveRecord::Base
  belongs_to :item
  belongs_to :user_who_received_review, class_name: User, foreign_key: :user_received_id
  belongs_to :user_who_gave_review, class_name: User, foreign_key: :user_given_id
  attr_accessible :description, :rating

  before_save :set_user_who_received_review
  validate :user_can_review_item

  def set_user_who_received_review
    self.user_who_received_review = item.seller
  end

  def user_can_review_item
    unless item.buyer == user_who_gave_review
      self.errors.add(:user_who_gave_review, "cannot make a review for this item.")
    end
  end

  RATINGS = [1,2,3,4,5]
end
