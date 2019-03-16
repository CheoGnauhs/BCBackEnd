class ItemsController < ApplicationController
  def index
    @items = Item.active.limit(20)
  end

  def search
  end
end
