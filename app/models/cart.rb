class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :items, :through => :cart_items
  attr_accessible :purchased_at

  def build_dwolla_params(current_user, bankinfo)
    all_other_fees = payments
    first_amount = all_other_fees.pop()
    {
      'client_id'     => DWOLLA_KEY,
      'client_secret' => DWOLLA_SECRET,
      'destinationId' => first_amount.destinationId,
      'amount'        => first_amount.amount,
      'firstName'     => current_user.firstName,
      'lastName'      => current_user.lastName,
      'emailAddress'  => current_user.email,
      'routingNumber' => bankinfo['routingNumber'],
      'accountNumber' => bankinfo['accountNumber'],
      'accountType'   => bankinfo['accountType'],
      'assumeCosts'   => true,
      'notes'         => 'Thank you!',
      'additionalFees'=> all_other_fees
    }
  end

  def payments
    payment = []
    items.each do |item|
      payment << { destinationId: item.seller.authentications.find_by_provider('dwolla').uid, amount: item.price*(1-item.percentage) }
      payment << { destinationId: item.charity.uid, amount: item.price*item.percentage }
    end
    payment
  end
end
