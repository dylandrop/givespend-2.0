class PurchasedCartMailer < ActionMailer::Base

  def purchase_notification cart_id
    @cart = Cart.find(cart_id)
    mail subject: "Thanks for shopping on Givespend", to: @cart.user.email
  end
end