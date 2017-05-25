class Theme < ApplicationRecord

  # Associations
  
  has_many :categories

  has_many :towers, through: :categories

  # Validators

  validates :name, presence: true
end
