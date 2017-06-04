class TowerGuardsController < ApplicationController
  #before_action :authenticate_user!

  def apply
    @tower_guard = TowerGuard.new
  end

  def apply_confirm

  end

  def apply_create

  end

end
