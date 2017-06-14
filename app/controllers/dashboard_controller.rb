class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @reports = {}

    current_user.subscribed_reports.order(created_at: :asc).each do |report|
      key = report.created_at.strftime('%m/%Y')
      @reports[key] ||= []
      @reports[key] << report
    end
  end
end
