class Subscription < ApplicationRecord

  monetize :amount_cents

  belongs_to :tower
  belongs_to :owner, class_name: 'User'

  has_many :user_subscriptions
  has_many :users, through: :user_subscriptions

  has_many :subscription_billings
  has_many :billings, through: :subscription_billings

  RECURRENCES = %w(monthly).freeze
end
