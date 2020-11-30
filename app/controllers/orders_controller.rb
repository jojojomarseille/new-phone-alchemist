class OrdersController < ApplicationController
  def create
  product = Product.find(params[:product_id])
  order  = Order.create!(product_id: product.id, product_sku: product.sku, amount: product.price, state: 'pending', user: current_user)



session = Stripe::Checkout::Session.create(
  payment_method_types: ['card'],
  line_items: [{
    name: "commande no #{order.id}",
    description: 'Votre commande',
    images: [product.photo_url],
    amount: product.price_cents,
    currency: 'eur',
    quantity: 1,
  }],
  success_url: order_url(order),
  cancel_url: order_url(order),
)


  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
end

def show
  @order = current_user.orders.find(params[:id])
  @product = Product.find(@order.product_id)
end


def index
  @orders = Order.all.page(params[:page]).per(50)
  @orderspending = Order.where(state: "pending").page(params[:page]).per(50)
  @orderspaid = Order.where(state: "paid").page(params[:page]).per(50)
  @ordersenverif = Order.where(state: "enverif").page(params[:page]).per(50)
  @ordersvalidé = Order.where(state: "validé").page(params[:page]).per(50)
  @orderslivré = Order.where(state: "livré").page(params[:page]).per(50)

end

def update
Order.find(params[:id]).update  state: params[:state]
    redirect_to "/orders"
end

end
