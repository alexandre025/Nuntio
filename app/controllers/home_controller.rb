class HomeController < ApplicationController
  before_action :require_team_tenancy, only: [:dashboard]

  def index

  end

  def dashboard

  end
end
