class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @reports = {}
    order = params[:order] || :asc

    @d = current_user.subscribed_reports.ransack(params[:q])

    @d.result.order(created_at: order).each do |report|
      key = report.created_at.strftime('%m/%Y')
      @reports[key] ||= []
      @reports[key] << report
    end
  end
end
