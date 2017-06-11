class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  before_action :prevent_already_confirmed, except: :simulate

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
      @subscription.update(state: :draft) unless @subscription.draft?
    else
      redirect_to dashboard_path
    end
  end

  def payment
    if @subscription = Subscription.find_by(id: session[:current_subscription_id])
      redirect_to edit_subscription_path if @subscription.draft?
    else
      redirect_to dashboard_path
    end
  end

  def update
    subscription = Subscription.find_by(id: session[:current_subscription_id])

    return redirect_to dashboard_path if !subscription || subscription.confirmed?

    if subscription.draft?
      subscription.update(subscription_params)
      subscription.to_payment!
      return redirect_to payment_subscription_path
    elsif subscription.payment?
      pay = Pay.new(subscription, params)

      pay.on(:ok) do |subscription|
        session[:current_subscription_id] = nil
        redirect_to dashboard_path
      end

      pay.on(:invalid) do |subscription|
        redirect_to payment_subscription_path
      end

      # begin
      pay.call
      # rescue StandardError => e
      # redirect_to payment_subscription_path, alert: e.to_s
      # end
    end
  end

  def simulate
    subscription = Subscription.new(subscription_params)
    render json: { quantity_discount_percent: subscription.quantity_discount_percent * 100, amount: subscription.calculate_amount.to_d, total_discount: subscription.total_discount.to_d }
  end

  private
    def prevent_already_confirmed
      if subscription = Subscription.find_by(id: session[:current_subscription_id], state: :confirmed)
        session[:current_subscription_id] = nil
      end
    end

    def subscription_params
      params.require(:subscription).permit(:tower_id, :owner_id, :state, :commitment, :quantity)
    end
end
