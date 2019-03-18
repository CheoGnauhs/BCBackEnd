class ItemsController < ApplicationController
  before_action :authorize_session, except: %i[index search show comments]
  before_action :get_item, only: %i[collection cancel_collection show add_comment close]

  def index
    @items = Item.active.limit(20)
    @user = current_user if signed_in?
  end

  def search
    @items = Item.active.where('name LIKE :needle OR description LIKE :needle OR field LIKE :needle', needle: "%#{params[:q]}%")
    @user = current_user if signed_in?
    render :index
  end

  def show
    @user = current_user if signed_in?
  end

  def create
    if params[:id] && @item = Item.find(params[:id])
      @item.update!(item_params.merge(status: :active))
    else
      @item = Item.create!(item_params.merge(seller: current_user, status: :active))
    end
    @item.set_tags(params[:field])
  end

  def collection
    unless @item.collections.where(user: current_user).first
      Collection.create!(item: @item, user: current_user)
    end
    render status: :ok, json: {}
  end

  def cancel_collection
    if cl = @item.collections.where(user: current_user).first
      cl.destroy!
    end
    render status: :ok, json: {}
  end

  def close
    if @item.seller.id != current_user.id
      render status: :unauthorized, json: {}
    else
      @item.update!(status: :closed)
      render status: :ok, json: {}
    end
  end

  def upload
    @item = Item.create!(seller: current_user)
    @item.cover.attach(params[:file])
  end

  def comments
    comments = Comment.includes(:user).where(item_id: params[:id]).order('created_at ASC')
    @headless = comments.find_all { |c| c.thread_id.nil? }
    thread_map = {}
    @replies = {}
    @headless.each { |h| thread_map[h.id] = h.id }
    comments.each do |c|
      next if c.thread_id.nil?
      @replies[thread_map[c.thread_id]] ||= []
      @replies[thread_map[c.thread_id]] << c
      thread_map[c.id] = thread_map[c.thread_id]
    end
  end

  def add_comment
    comment = Comment.create!(content: params[:content], user: current_user, thread_id: params[:thread], item: @item)
    NotificationMailer.comment_notification(@item.seller, comment, request.host).deliver_now
    render status: :ok, json: comment
  end

  private
    def get_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.permit(:id, :name, :price, :description, :fineness, :method, :district)
    end
end
