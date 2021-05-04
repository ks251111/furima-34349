class CategorysController < ApplicationController

  def show
    @item = Item.find_by(category_id: params[:id])
    @items = Item.where(category_id: params[:id]).order('created_at DESC')
  end

end
