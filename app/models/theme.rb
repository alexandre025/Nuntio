class Theme < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Associations

  has_many :categories

  has_many :towers, through: :categories

  # Validators

  validates :name, presence: true
end
