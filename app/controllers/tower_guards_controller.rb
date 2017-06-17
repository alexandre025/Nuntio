class TowerGuardsController < ApplicationController
  #before_action :authenticate_user!

  def apply
    @tower_guard = TowerGuard.new
  end

  def apply_create
    redirect_to apply_tower_guards_confirm_path
  end

  def apply_confirm
  end

end
