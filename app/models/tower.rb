class Tower < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

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

  GRADES = %w(beginner intermediate advanced).freeze

  # Validators

  validates :category, :title, :description, presence: true
end
