class CartsController < ApplicationController
  def add
    begin 
      cart_item = current_cart.cart_items.find_or_initialize_by_item_id(params[:item_id])
      cart_item.save
      render nothing: true
    rescue NameError => e
    end
  end

  def remove
    current_cart.cart_items.where(id: params[:id]).destroy!
    render nothing: true
  end

  def checkout
  end
end
