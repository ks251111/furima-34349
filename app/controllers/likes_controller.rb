class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, item_id: params[:item_id])
    redirect_to item_path(@like.item)
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id]).destroy
    redirect_to item_path(@like.item)
  end

end
