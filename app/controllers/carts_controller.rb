class CartsController < ApplicationController
  # route: cart GET /cart(.:format) carts#show
  def show
    if cookies[:cart].present? == false || cart_subtotal_cents == 0 then
      # rendered empty cart page when cart is empty
      render 'emptycart'
    end
  end
  # route: add_item_cart POST /cart/add_item(.:format) carts#add_item
  def add_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, +1)
    redirect_to :back
  end
  # route: remove_item_cart POST /cart/remove_item(.:format) carts#remove_item
  def remove_item
    product_id = params[:product_id].to_s
    modify_cart_delta(product_id, -1)
    redirect_to :back
  end

  private

  def modify_cart_delta(product_id, delta)
    cart[product_id] = (cart[product_id] || 0) + delta
    cart.delete(product_id) if cart[product_id] < 1
    update_cart cart
  end

end
