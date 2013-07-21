class PayoutJob
  def self.distribute_payments txn_id
    transaction = Transaction.find txn_id
    items = transaction.cart.items
    items.each do |item|
      seller_token = item.seller.authentications.where(provider: "stripe_connect").first.token
      nonprofit_token = item.nonprofit.authentication.token
      new_token1 = Stripe::Token.create(
        {customer: transaction.stripe_customer_token},
        nonprofit_token
      ).id
      Stripe::Charge.create({
          amount: (item.price * (1 - item.percentage / 100.0)).to_i,
          currency: 'usd',
          card: new_token1,
          description: "Charge for item #{item.id} to seller"},
          seller_token
        )
      new_token2 = Stripe::Token.create(
        {customer: transaction.stripe_customer_token},
        nonprofit_token
      ).id
      Stripe::Charge.create({
          amount: (item.price * (item.percentage / 100.0)).to_i,
          currency: 'usd',
          card: new_token2,
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