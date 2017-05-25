class Category < ApplicationRecord

  # Associations

  belongs_to :theme

  has_many :towers

  # Validators

  validates :theme, presence: true
  validates :name, uniqueness: { scope: :theme_id }
end
