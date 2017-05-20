class Tower < ApplicationRecord
  monetize :price_per_month_cents

  belongs_to :category

  FREQUENCIES = %w(monthly).freeze

  validates :category, :title, :description, presence: true

  has_one :tower_guard
  has_one :guard, through: :tower_guard

  # has_many :tower_guards
  # has_many :guards, through: :tower_guards
end
