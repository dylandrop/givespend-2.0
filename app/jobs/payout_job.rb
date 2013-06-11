class PayoutJob < QC::Worker
  def self.distribute_payments txn_id
    transaction = Transaction.find txn_id
    items = transaction.cart.items
    items.each do |item|
      seller_token = item.user.authentications.where(provider: "stripe_connect").uid
      nonprofit_token = item.nonprofit.token
      Stripe::Charge.create ({
          amount: item.price * (1 - percentage / 100.0),
          currency: 'usd',
          card: transaction.stripe_customer_token,
          description: "Charge for item #{item.id} to seller"},
          seller_token
        )
      Stripe::Charge.create ({
          amount: item.price * (percentage / 100.0),
          currency: 'usd',
          card: transaction.stripe_customer_token,
          description: "Charge for item #{item.id} to nonprofit"},
          nonprofit_token
        )
      item.update_attributes(purchased_at: Time.now)
    end
  end

  def handle_failure(job, e)
    Rails.logger.debug e
  end
end