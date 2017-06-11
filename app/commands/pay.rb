class Pay < BaseCommand
  def initialize(subscription, params)
    @subscription = subscription
    @params = params
  end

  def call
    byebug

    if @subscription.payment?

      # Here we'll call Stripe then register credit card minimal informations in a callback

      credit_card = @params[:payment][:credit_card_id] ? CreditCard.find(@params[:payment][:credit_card_id]) : nil

      transaction do

        unless credit_card
          credit_card = CreditCard.create_from_params(@params, @subscription.owner)
        end

        @subscription.confirm

      end

      return broadcast :ok, @subscription
    end

    broadcast :invalid, @subscription
  end
end
