class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_cart

  def current_cart
    if current_user
      if session[:cart_id]
        @current_cart ||= Cart.find(session[:cart_id])
        session[:cart_id] = nil if not @current_cart.purchased_at.nil?
      end
      if session[:cart_id].nil?
        @current_cart = current_user.carts.create!
        session[:cart_id] = @current_cart.id
      end
      @current_cart
    else
      nil
    end
  end
end
