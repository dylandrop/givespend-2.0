class Item < ActiveRecord::Base
  belongs_to :nonprofit
  has_many :cart_items
  has_many :carts, through: :cart_items
  belongs_to :category
  has_one :review
  belongs_to :seller, class_name: User
  belongs_to :buyer, class_name: User, foreign_key: :bought_by_id
  has_one :image, as: :imageable
  after_destroy :clean_image

  attr_accessible :description, :expires_from_cart_at, :name, :percentage, :price, 
    :purchased_at, :category_id, :nonprofit_id, :image_attributes, as: [:default, :admin]
  attr_accessible :seller_id, as: :admin

  PERCENTAGES = [5,10,15,25,50,75,100]
  accepts_nested_attributes_for :image

  before_save :price_to_cents
  validates :nonprofit, :seller, :name, :percentage, :price, :category, presence: true
  validates :percentage, inclusion: { in: PERCENTAGES }
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  def clean_image
    self.image.destroy if self.image
  end

  def price_in_dollars
    '%.2f' % (price.to_i/100.0)
  end

  def reviewed?
    review.present?
  end

  private

  def price_to_cents
    if self.price_changed?
      self.price *= 100
    end
  end
end
