class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item
  attr_accessible :cart_id, :item_id
end
