class Category < ApplicationRecord
  belongs_to :theme

  validates :theme, presence: true
  validates :name, uniqueness: { scope: :theme_id }
end
