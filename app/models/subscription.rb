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
    self.amount = calculate_amount_for(commitment, quantity)
  end

  def calculate_amount_for_commitment(selected_commitment)
    base_price = tower.price_per_month
    final_price = base_price

    case selected_commitment
    when 'biannual'
      final_price = base_price * 0.95
    when 'yearly'
      final_price = base_price * 0.90
    end

    return final_price
  end

  def calculate_amount_for(selected_commitment, selected_quantity = 1)
    final_price = calculate_amount_for_commitment(selected_commitment)

    if selected_quantity >= 2 && selected_quantity <= 5
      final_price = final_price * 0.95
    elsif selected_quantity >= 6 && selected_quantity <= 20
      final_price = final_price * 0.90
    elsif selected_quantity >= 21 && selected_quantity <= 50
      final_price = final_price * 0.85
    elsif selected_quantity >= 51
      final_price = final_price * 0.80
    end

    return final_price
  end
end
