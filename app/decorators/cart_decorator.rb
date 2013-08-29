class CartDecorator < Draper::Decorator
  delegate_all

  def items_already_purchased_error_message
    purchased_items = items.collect { |item| item.purchased_at.nil? }
    purchased_items.count > 1 ? "The items #{purchased_items.collect(&:name).join(', ')} have already been purchased" : "The item #{purchased_items.first.name} has already been purchased." 
  end
end