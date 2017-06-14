class ReportsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tower = Tower.friendly.find(params[:tower_id])

    if current_user.subscribed_towers.include? @tower
      @report = @tower.reports.find(params[:id])
    else
      redirect_to dashboard_path
    end
  end
end
