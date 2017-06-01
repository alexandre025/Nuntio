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

    state :complete do

    end

  end

  # Methods

  def calculate_and_set_amount
    self.amount = calculate_amount_for_commitment_and_quantity
  end

  def calculate_amount_for_commitment
    base_price = tower.price_per_month
    final_price = base_price

    case commitment
    when 'biannual'
      final_price = base_price * 0.95
    when 'yearly'
      final_price = base_price * 0.90
    end

    return final_price
  end

  def calculate_amount_for_commitment_and_quantity
    final_price = calculate_amount_for_commitment

    if quantity >= 2 && quantity <= 5
      final_price = final_price * 0.95
    elsif quantity >= 6 && quantity <= 20
      final_price = final_price * 0.90
    elsif quantity >= 21 && quantity <= 50
      final_price = final_price * 0.85
    elsif quantity >= 51
      final_price = final_price * 0.80
    end

    return final_price * quantity
  end
end
