class SoldAnItemMailer < ActionMailer::Base

  def item_sold item_id, buyer_id
    @item = Item.find(item_id)
    @buyer = User.find(buyer_id)
    mail subject: "You just sold #{@item.name} on Givespend!", to: @item.seller.email
  end
end