class ReviewsController < ApplicationController
  def create
    strip_item
    review = Review.new(params[:review])
    review.item = Item.find(@item_id)
    review.user_who_gave_review = current_user
    if review.save
      flash[:notice] = "Successfully created"
    else
      flash[:error] = review.errors.full_messages
    end
    flash.keep
    redirect_to my_profile_path
  end

  private 

  def strip_item
    @item_id = params[:review].extract!(:item_id)[:item_id]
  end
end
