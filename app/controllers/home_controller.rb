class HomeController < ApplicationController
  def index
    @q = Tower.ransack(params[:q])

    @popular_towers = @q.result.sort_by(&:good_notation_percent).reverse.take(10)
  end
end
