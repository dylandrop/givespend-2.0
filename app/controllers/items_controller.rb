class ItemsController < ApplicationController
  before_filter :authorize_seller, :only => :new

  def new
    @item = Item.new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
    @categories = Category.all
  end

  private

  def authorize_seller
    if not current_user
      redirect_to new_user_session_url
    elsif current_user.authentications.where(provider: 'stripe_connect').empty?
      redirect_to verify_seller_user_path(current_user)
    end
  end

end
