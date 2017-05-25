class Tower < ApplicationRecord
  include Commentable

  monetize :price_per_month_cents

  # Associations

  belongs_to :category

  has_one :tower_guard
  has_one :guard, through: :tower_guard

  # has_many :tower_guards
  # has_many :guards, through: :tower_guards

  # Constants

  FREQUENCIES = %w(monthly).freeze

  # Validators

  validates :category, :title, :description, presence: true
end
