class Item < ActiveRecord::Base
  belongs_to :nonprofit
  belongs_to :cart
  belongs_to :category
  belongs_to :seller, class_name: "User"
  has_one :image, as: :imageable

  attr_accessible :description, :expires_from_cart_at, :name, :percentage, :price, :purchased_at, :category_id, :nonprofit_id
  PERCENTAGES = [5,10,15,25,50,75,100]
  accepts_nested_attributes_for :image

  before_create :price_to_cents
  validates :nonprofit, :seller, :name, :percentage, :price, :category, presence: true
  validates :percentage, inclusion: { in: PERCENTAGES }
  validates :price, numericality: { greater_than_or_equal_to: 100 }

  private

  def price_to_cents
    if self.price.is_a? Fixnum
      self.price = self.price * 100
    end
  end
end
