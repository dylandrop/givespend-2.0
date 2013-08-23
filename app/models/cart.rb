class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :items, :through => :cart_items
  attr_accessible :purchased_at, :item_ids

  def self.purchase c_id
    find(c_id).purchase!
  end

  def purchase!
    time_purchased = Time.now
    self.update_attribute(:purchased_at, time_purchased)
    PurchasedCartMailer.delay.purchase_notification cart.id
    items.each do |item|
      item.purchased_at = time_purchased
      item.buyer = user
      item.save!
      SoldAnItemMailer.delay.item_sold item.id, user.id
    end
  end
end
