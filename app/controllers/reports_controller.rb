class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @item = Item.find(params[:item_id])
    @report = Report.new
    @reports = @item.reports.includes(:user)
  end

  def create
    @item = Item.find(params[:item_id])
    @report = Report.create(report_params)
    if @report.save
      redirect_to item_path(@report.item)
    else
      @item = @report.item
      @reports = @item.reports
      render "items/show"
    end
  end

  private

  def report_params
    params.require(:report).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
