class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_cart

  before_filter :fetch_categories
  before_filter :preview_state

  def fetch_categories
    @categories = Category.all
  end

  def preview_state
    if Rails.env == "production"
      redirect_to preview_path unless (on_items_path || params[:controller] == "pages")
    end
  end

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

  private

  def on_items_path
    params[:controller] == "items" && (params[:action] == "show" || params[:action] == "index")
  end
end
