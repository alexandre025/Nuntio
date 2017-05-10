class Team < ApplicationRecord

  # Validators

  validates :name, presence: true
  validates :code, presence: true, uniqueness: true, format: { with: %r{[a-z\d]+([-_][a-z\d]+)}i }


  # Callbacks

  before_create do
    Apartment::Tenant.create(code)
    Apartment::Tenant.switch!(code)
  end


  # Methods

  def self.current
    self.find_by(code: Apartment::Tenant.current)
  end
end
