class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Associations

  belongs_to :theme

  has_many :towers

  # Validators

  validates :theme, presence: true
  validates :name, uniqueness: { scope: :theme_id }
end
