class UsersController < ApplicationController
  def show
    @user = User.includes(reviews_received: [:user_who_gave_review]).find(params[:id])
  end

  def verify_seller
    user_url = user_url(current_user)
    @stripe_parameters = current_user.build_stripe_params(user_url)
  end
end
