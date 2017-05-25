class SubscriptionController < ApplicationController
  before_action :authenticate_user!

  def create
    tower = Tower.find(params[:tower_id])
    Subscription.create(owner: current_user, tower: tower)
  end

  def edit

  end

  def update

  end

end
