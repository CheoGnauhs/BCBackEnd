class ProfileController < ApplicationController
  before_action :authorize_session

  def show
    @user = current_user
  end

  def collections
    @collections = current_user.collections.map(&:item)
  end

  def orders
    render status: :ok, json: []
  end

  def items
  end
end
