class OrdersController < ApplicationController
  def create
  cart = Cart.find(params[:cart_id])
  order  = Order.create!(cart: cart, cart_sku: cart.sku, amount: cart.price, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: cart.sku,
      images: [cart.photo_url],
      amount: cart.price_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
end

def show
  @order = current_user.orders.find(params[:id])
end

end
