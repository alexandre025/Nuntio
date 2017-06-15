class TowerGuard < ApplicationRecord
  belongs_to :guard, class_name: 'User'
  belongs_to :tower

  attr_accessor :linkedin, :apply_theme

  validates :roles, :guard, :tower, presence: true

  ROLES = %w(author owner).freeze
end
