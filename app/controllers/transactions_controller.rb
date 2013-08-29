class TransactionsController < ApplicationController
  before_filter :ensure_user_has_shipping_info, only: :create
  before_filter :ensure_carts_items_are_not_purchased, only: :create

  def create
    @transaction = Transaction.new(cart_id: current_cart.id, status: 'processing')
    @transaction.stripe_card_token = params[:stripe_card_token]
    if @transaction.save_with_card
      redirect_to @transaction, :notice => "Thank you for your purchase!"
    else
      render 'carts/show'
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
    if current_user.id != @transaction.cart.user.id
      @transaction = nil
    end
  end

  private
  def ensure_user_has_shipping_info
    redirect_to(edit_user_registration_path, alert: "Complete your shipping info to purchase an item.") unless current_user.has_shipping_address?
  end

  def ensure_carts_items_are_not_purchased
    redirect_to(items_path, error: current_cart.items_already_purchased_error_message) unless current_cart.items.all?(&:active)
  end
end
