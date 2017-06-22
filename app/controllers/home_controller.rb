class HomeController < ApplicationController
  def index
    @popular_towers = Tower.where(is_featured: true).limit(10).sort_by(&:good_notation_percent).reverse
  end
end
