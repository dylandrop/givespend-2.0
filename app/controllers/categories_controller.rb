class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = Item.active.where(category_id: params[:id]).page(params[:page]).per(8).includes(:nonprofit, :image)
  end
end
