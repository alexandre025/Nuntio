class TowersController < ApplicationController

  before_action :set_themes, only: [:index, :theme, :category]

  def index
    @towers = Tower.all.page(params[:page]).per(20)
  end

  def theme
    @theme = Theme.friendly.find(params[:id])
    @towers = @theme.towers.page(params[:page]).per(20)
  end

  def category
    @theme = Theme.friendly.find(params[:theme_id])

    @category = @theme.categories.friendly.find(params[:id])
    @towers = @category.towers.page(params[:page]).per(20)
  end

  def show
    @tower = Tower.friendly.find(params[:id])
  end

  private

  def set_themes
    @themes = Theme.all
  end
end
