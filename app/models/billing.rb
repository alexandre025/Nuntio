class Billing < ApplicationRecord
  monetize :amount_cents

  belongs_to :subscription

  delegate :owner, to: :subscription

  validates :amount_cents, :subscription, :begin_at, :end_at, presence: true

  # TODO : Add a state machine
end
