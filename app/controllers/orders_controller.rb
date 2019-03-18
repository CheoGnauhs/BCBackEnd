class OrdersController < ApplicationController
  before_action :authorize_session
  before_action :get_order, only: %i[ensure cancel blockchain]

  def create
    @item = Item.find(params[:item_id])
    @user = current_user
    if current_user.balance < @item.price
      render status: :ok, json: { error: 'BALANCE_NOT_ENOUGH' }
    elsif !@item.active?
      render status: :ok, json: { error: 'NOT_AVAILABLE' }
    else
      Order.transaction do
        current_user.update!(balance: current_user.balance - @item.price)
        @item.update!(status: :sold)
        @order = Order.create!(address: params[:address], telephone: params[:telephone],
                               status: :progress, user: current_user, item: @item)
      end
      NotificationMailer.order_notification(@item.seller, @order).deliver_now
    end
  end

  def ensure
    if @order.buyer_id == current_user.id
      @order.update!(status: :finished)
      render status: :ok, json: {}
    else
      render status: :unauthorized, json: {}
    end
  end

  def blockchain
  end

  def cancel
    if @order.buyer_id == current_user.id
      @order.update!(status: :cancelled)
      render status: :ok, json: {}
    else
      render status: :unauthorized, json: {}
    end
  end

  private
    def get_order
      @order = Order.find(params[:id])
    end
end
