class ProfileController < ApplicationController
  before_action :authorize_session

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update!(profile_params)
    render :show
  end

  def collections
    @items = current_user.collections.map(&:item)
    render :items
  end

  def orders
    render status: :ok, json: []
  end

  def items
    @items = current_user.items
  end

  private
    def profile_params
      params.permit(:telephone, :location, :district, :address, :email, :name)
    end
end
