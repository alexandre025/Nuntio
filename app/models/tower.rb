class Tower < ApplicationRecord

  monetize :price_per_month_cents

  belongs_to :category

  FREQUENCIES = %w(monthly).freeze

  validates :category, :title, :description, presence: true
end
