class CategoriesController < ApplicationController
  def show
    @items = Item.where(category_id: params[:id]).page(params[:page]).per(8).includes(:nonprofit, :image)
  end
end
