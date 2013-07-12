class OrdersController < ApplicationController

  def create
    @order = Order.new params[:order]
    @order.code = rand 1000..9999 if @order.action_id == 1
    if @order.save
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end

end