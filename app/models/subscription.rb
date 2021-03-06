class Subscription < ApplicationRecord
  monetize :amount_cents

  # Associations

  belongs_to :tower

  belongs_to :owner, class_name: 'User'

  # For BtoB we have multiple users associated to a single subscription
  has_many :user_subscriptions
  has_many :users, through: :user_subscriptions

  has_many :billings

  COMMITMENTS = %w(monthly biannual yearly).freeze

  validates :amount_cents, :tower, :owner, presence: true

  # State machines

  state_machine initial: :draft do

    state :draft do

    end

    state :payment do

    end

    state :confirmed do

    end

    event :to_payment do
      transition draft: :payment
    end

    event :confirm do
      transition payment: :confirmed
    end

    before_transition draft: :payment do |subscription|
      subscription.amount = subscription.calculate_amount
    end

    before_transition payment: :confirmed do |subscription|
      subscription.user_subscriptions.create(user: subscription.owner)
      subscription.confirmed_at = DateTime.current
      Billing.create_from_subscription(subscription)
    end

  end

  # Methods

  def calculate_amount
    tower.price_per_month * quantity - total_discount
  end

  def total_discount
    tower.price_per_month * (commitment_discount_percent + quantity_discount_percent) * quantity
  end

  def commitment_discount_percent
    discount = 0

    case commitment
    when 'biannual'
      discount = 0.05
    when 'yearly'
      discount = 0.1
    end

    return discount
  end

  def quantity_discount_percent
    self.quantity ||= 1
    discount = 0

    if quantity >= 2 && quantity <= 5
      discount = 0.05
    elsif quantity >= 6 && quantity <= 20
      discount = 0.1
    elsif quantity >= 21 && quantity <= 50
      discount = 0.15
    elsif quantity >= 51
      discount = 0.2
    end

    return discount
  end
end
