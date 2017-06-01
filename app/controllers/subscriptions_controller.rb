class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    subscription = Subscription.find_or_initialize_by(subscription_params)

    if subscription.save!
      session[:current_subscription_id] = subscription.id
      redirect_to edit_subscription_path
    else
      redirect_to tower_path(tower)
    end
  end

  def edit
    # We use find_by because we don't want to raise an error if record not found
    if @subscription = Subscription.find_by(id: session[:current_subscription_id])

    else
      redirect_to dashboard_path
    end
  end

  def payment
    @subscription = Subscription.find_by(id: session[:current_subscription_id])
    redirect_to edit_subscription_path if @subscription.draft?
  end

  def update
    subscription = Subscription.find_by(id: session[:current_subscription_id])

    if subscription.draft?
      subscription.update(subscription_params)
      subscription.to_payment!
      redirect_to subscription_payment_path
    elsif subscription.payment?
      # Proceed payment
      # redirect to dashboard
    end
  end

  def simulate
    subscription = Subscription.new(subscription_params)
    render json: { price_with_selected_commitment: subscription.calculate_amount_for_commitment.to_d, final_price: subscription.calculate_amount_for_commitment_and_quantity.to_d }
  end

  private

    def subscription_params
      params.require(:subscription).permit(:tower_id, :owner_id, :state, :commitment, :quantity)
    end
end
