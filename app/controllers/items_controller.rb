class ItemsController < ApplicationController
  before_action :authorize_session, except: %i[index search]
  before_action :get_item, only: %i[collection cancel_collection]

  def index
    @items = Item.active.limit(20)
    @user = current_user if signed_in?
  end

  def search
  end

  def create
    if params[:id] && @item = Item.find(params[:id])
      @item.update!(item_params.merge(status: :active))
    else
      @item = Item.create!(item_params.merge(seller: current_user, status: :active))
    end
  end

  def collection
    unless @item.collections.where(user: current_user).first
      Collection.create!(item: @item, user: current_user)
    end
    render status: :ok, nothing: true
  end

  def cancel_collection
    if cl = @item.collections.where(user: current_user).first
      cl.destroy!
    end
    render status: :ok, nothing: true
  end

  def upload
    @item = Item.create!(seller: current_user)
    @item.cover.attach(params[:file])
  end

  private
    def get_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.permit(:id, :name, :price, :description)
    end
end
