class HomeController < ApplicationController
  def index
    @q = Tower.ransack(params[:q])

    @popular_towers = @q.result.order(:created_at).limit(10)
  end
end
