class ItemsController < ApplicationController
  before_filter :authorize_seller, :only => :new

  def new
    @item = Item.new
    @item.build_image(params[:item])
  end

  def create
    @item = Item.new(params[:item])
    @item.seller = current_user
    if @item.save
      flash[:notice] = "Item listed."
      redirect_to items_path(@item)
    else
      flash[:error] = "There were issues with your listing."
      render :new, params
    end
  end

  def show
    @item = Item.find(params[:id])
    respond_to do |format|
      format.html { render :layout => !request.xhr? }
    end
  end

  def index
    @items = Item.active.page(params[:page]).per(8).includes(:nonprofit, :image)
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
