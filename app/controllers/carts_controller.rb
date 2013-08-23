class CartsController < ApplicationController
  before_filter :ensure_user_has_shipping_info, only: :show

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

  private
  def ensure_user_has_shipping_info
    redirect_to(edit_user_registration_path, alert: "Complete your shipping info to purchase an item.") unless current_user.has_shipping_address?
  end
end
