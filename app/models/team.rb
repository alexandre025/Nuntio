class Team < ApplicationRecord

  # Validators

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
end
