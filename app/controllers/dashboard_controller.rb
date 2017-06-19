class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @reports = {}
    order = params[:order] || :asc

    @d = current_user.subscribed_reports.ransack(params[:q])

    @d.result.order(created_at: order).each do |report|
      key = l(report.created_at, format: '%B %Y').capitalize
      @reports[key] ||= []
      @reports[key] << report
    end
  end
end
