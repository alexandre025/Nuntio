class Subscription < ApplicationRecord
  monetize :amount_cents

  # Associations

  belongs_to :tower

  belongs_to :owner, class_name: 'User'

  # For BtoB we have multiple users associated to a single subscription
  has_many :user_subscriptions
  has_many :users, through: :user_subscriptions

  has_many :subscription_billings
  has_many :billings, through: :subscription_billings

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

    before_transition draft: :payment do |subscription|
      subscription.amount = subscription.calculate_amount
    end

  end

  # Methods

  def calculate_amount
    tower.price_per_month - total_discount
  end

  def total_discount
    tower.price_per_month * (commitment_discount_percent + quantity_discount_percent)
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
