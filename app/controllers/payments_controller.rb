class PaymentsController < ApplicationController


  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @product = Product.find(@order.product_id)
    gon.order = @order
    gon.current_order_id = @order.id
    @user = current_user
    @userCodes = Code.where(user_id: @user.id)
    @userCodesUsable = @userCodes.where(status: "a valider" )
  end


end
