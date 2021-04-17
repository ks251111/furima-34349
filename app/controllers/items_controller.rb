class ItemsController < ApplicationController
  def index
  end
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
  params.require(:item).permit(:image, :title, :text, :category_id, :status_id, :burden_id, :area_id, :day_id, :price)
  end
  
end
