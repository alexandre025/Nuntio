class Subscription < ApplicationRecord

  monetize :amount_cents

  belongs_to :tower

  belongs_to :owner, class_name: 'User'

  # For BtoB we have multiple users associated to a single subscription
  has_many :user_subscriptions
  has_many :users, through: :user_subscriptions

  has_many :subscription_billings
  has_many :billings, through: :subscription_billings

  RECURRENCES = %w(monthly quarterly biannual).freeze

  validates :amount_cents, :tower, :owner, presence: true

  # Methods

  def calculate_and_set_amount
    self.amount = calculate_amount_for(recurrence)
  end

  def calculate_amount_for(selected_recurrence)
    case selected_recurrence
    when 'monthly'
      tower.price_per_month
    when 'quarterly'
      tower.price_per_month * 4
    when 'biannual'
      tower.price_per_month * 6
    else
      0
    end
  end

end
