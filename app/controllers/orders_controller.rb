class OrdersController < ApplicationController
  before_action :authorize_session

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
                               status: :active, user: current_user, item: @item)
      end
    end
  end
end
