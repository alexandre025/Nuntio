class TowersController < ApplicationController
  before_action :set_themes, only: [:index, :theme, :category]

  def index
    @q = Tower.ransack(params[:q])

    @recommended_towers = @q.result.order('random()').limit(10)
    @newest_towers = @q.result.order(:created_at).limit(10)
    @popular_towers = @q.result.sort_by(&:average_notation).reverse.take(10)
  end

  def theme
    @theme = Theme.friendly.find(params[:id])

    @q = @theme.towers.ransack(params[:q])
    @towers = @q.result
    @towers = Kaminari.paginate_array(@towers).page(params[:page]).per(16)
  end

  def category
    @theme = Theme.friendly.find(params[:theme_id])
    @category = @theme.categories.friendly.find(params[:id])

    @q = @category.towers.ransack(params[:q])
    @towers = @q.result
    @towers = Kaminari.paginate_array(@towers).page(params[:page]).per(16)
  end

  def show
    @tower = Tower.find_by(slug: params[:id])
    if @tower
      @subscription = Subscription.new(tower: @tower, owner: current_user)
      @similars = Tower.where(category: @tower.category).order(created_at: :asc).limit(10)
      @report = @tower.reports.order(created_at: :asc).first
      @comments = @tower.comments.where.not(content: nil)
    else
      redirect_to root_path
    end
  end

  def search
    @q = Tower.ransack(params[:q])
    @q.build_sort if @q.sorts.empty?
    @towers = @q.result
    @towers = Kaminari.paginate_array(@towers).page(params[:page]).per(16)
  end

  private

    def set_themes
      @themes = Theme.all
    end
end
