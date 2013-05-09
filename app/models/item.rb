class Item < ActiveRecord::Base
  belongs_to :charity
  belongs_to :cart
  belongs_to :category
  belongs_to :user
  attr_accessible :description, :expires_from_cart_at, :name, :percentage, :price, :purchased_at, :category, :user, :charity
end
