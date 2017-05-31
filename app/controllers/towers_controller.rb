class TowersController < ApplicationController
  #before_action :authenticate_user!

  before_action :set_themes, only: [:index, :theme, :category]

  def index
    @q = Tower.ransack(params[:q])
    @towers = @q.result.page(params[:page]).per(20)
  end

  def theme
    @theme = Theme.friendly.find(params[:id])

    if params[:all]
      @q = @theme.towers.ransack(params[:q])
      @towers = @q.result.page(params[:page]).per(20)

      render :theme_all
    else
      @q = @theme.towers.ransack(params[:q])

      @newest_towers = @q.result.order(:created_at).limit(10)
      @popular_towers = @q.result.order(:created_at).limit(10)
    end
  end

  def category
    @theme = Theme.friendly.find(params[:theme_id])
    @category = @theme.categories.friendly.find(params[:id])

    @q = @category.towers.ransack(params[:q])
    @towers = @q.result.page(params[:page]).per(20)
  end

  def show
    @tower = Tower.friendly.find(params[:id])
    @subscription = Subscription.new(tower: @tower, owner: current_user)
  end

  private

    def set_themes
      @themes = Theme.all
    end
end
