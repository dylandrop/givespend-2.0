class TransactionsController < ApplicationController
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
end
