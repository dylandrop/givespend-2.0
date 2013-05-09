class ItemsController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def index
    @items = Item.all
  end
end
