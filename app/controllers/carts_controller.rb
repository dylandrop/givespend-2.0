class CartsController < ApplicationController
  def add
    cart = current_cart.items.build params[:item_id]
    cart.save!
  end

  def remove
  end

  def checkout
  end
end
