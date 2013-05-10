class UsersController < ApplicationController
  def show
  end

  def verify_seller
    user_url = user_url(current_user)
    @stripe_parameters = current_user.build_stripe_params(user_url)
  end
end
