class Transaction < ActiveRecord::Base
  belongs_to :cart
  attr_accessible :status, :stripe_customer_token, :cart_id, :stripe_card_token

  def save_with_card
    if valid?
      customer = Stripe::Customer.create(card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
      Cart.delay.purchase(self.cart_id)
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  def self.purchase_items_via_stripe
    puts "OK!"
  end
end
