class TowersController < ApplicationController

  def index
    @towers = Tower.all
  end

  def theme
    @theme = Theme.find(params[:id])
    @towers = @theme.towers
  end

  def show
    @theme = Theme.find(params[:theme_id])
    @tower = @theme.towers.find(params[:id])
  end
end
