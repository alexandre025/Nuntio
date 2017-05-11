class HomeController < ApplicationController
  before_action :require_team_tenancy, only: [:dashboard]
  before_action :authenticate_user!, only: [:dashboard]

  def index
  end

  def dashboard
  end
end
