class Item < ActiveRecord::Base
  belongs_to :charity
  belongs_to :cart
  belongs_to :category
  belongs_to :user
  attr_accessible :description, :expires_from_cart_at, :name, :percentage, :price, :purchased_at, :category_id, :user, :charity_id, :percentage
  PERCENTAGES = [5,10,15,25,50,75,100]

  before_save :price_to_cents

  private

  def price_to_cents
    self.price = self.price * 100
  end
end
