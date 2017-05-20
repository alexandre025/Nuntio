class Report < ApplicationRecord

  has_many :sources, class_name: 'ReportSource'

  belongs_to :tower
  belongs_to :tower_guard

  has_one :guard, through: :tower_guard

  validates :tower, :title, :content, :tower_guard, presence: true
end
