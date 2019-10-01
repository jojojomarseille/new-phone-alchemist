class OrdersController < ApplicationController
  def create
  cart = Cart.find(params[:cart_id])
  order  = Order.create!(cart: cart, cart_sku: cart.sku, amount: cart.price, state: 'pending', user: current_user)



session = Stripe::Checkout::Session.create(
  payment_method_types: ['card'],
  line_items: [{
    name: 'T-shirt',
    description: 'Comfortable cotton t-shirt',
    images: ['https://example.com/t-shirt.png'],
    amount: 500,
    currency: 'eur',
    quantity: 1,
  }],
  success_url: 'http://56cbd347.ngrok.io/products',
  cancel_url: 'http://56cbd347.ngrok.io/products',
)


  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
end

def show
  @order = current_user.orders.find(params[:user_id])
end

end
