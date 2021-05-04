class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :before_reports, only: [:index, :create]
  
  def index
    @report = Report.new
    @reports = @item.reports.includes(:user)
  end

  def create
    @report = Report.create(report_params)
    if @report.save
      redirect_to item_path(@report.item)
    else
      @item = @report.item
      @reports = @item.reports
      render :index
    end
  end

  private

  def report_params
    params.require(:report).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def before_reports
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
