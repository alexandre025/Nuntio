class TowersController < ApplicationController
  #before_action :authenticate_user!

  before_action :set_themes, only: [:index, :theme, :category]

  def index
    @q = Tower.ransack(params[:q])

    @recommended_towers = @q.result.order(:created_at).limit(10)
    @newest_towers = @q.result.order(:created_at).limit(10)
    @popular_towers = @q.result.order(:created_at).limit(10)
  end

  def theme
    @theme = Theme.friendly.find(params[:id])

    @q = @theme.towers.ransack(params[:q])
    @towers = @q.result.page(params[:page]).per(20)
  end

  def category
    @theme = Theme.friendly.find(params[:theme_id])
    @category = @theme.categories.friendly.find(params[:id])

    @q = @category.towers.ransack(params[:q])
    @towers = @q.result.page(params[:page]).per(20)
  end

  def show
    @tower = Tower.find_by(slug: params[:id])
    if @tower
      @subscription = Subscription.new(tower: @tower, owner: current_user)
    else
      redirect_to root_path
    end
  end

  def search
    @q = Tower.ransack(title_or_short_excerpt_or_guard_fullname_cont: params[:search][:q])
    @towers = @q.result.page(params[:page]).per(20)
  end

  private

    def set_themes
      @themes = Theme.all
    end
end
