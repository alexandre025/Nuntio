class ReportsController < ApplicationController
  before_action :authenticate_user!

  def show
    @report = Report.friendly.find(params[:id])
  end
end
