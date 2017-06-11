class Billing < ApplicationRecord
  monetize :amount_cents

  belongs_to :subscription

  delegate :owner, to: :subscription

  validates :amount_cents, :subscription, :begin_at, :end_at, presence: true

  # TODO : Add a state machine

  def self.create_from_subscription(subscription)
    Billing.create(
      subscription: subscription,
      state: :paid,
      amount: subscription.amount,
      begin_at: subscription.confirmed_at,
      end_at: subscription.confirmed_at+30
    )
  end
end
