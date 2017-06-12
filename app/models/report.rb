class Report < ApplicationRecord
  include Commentable

  has_many :sources, class_name: 'ReportSource'

  belongs_to :tower
  belongs_to :tower_guard

  has_one :guard, through: :tower_guard

  validates :tower, :title, :content, :tower_guard, presence: true

  def average_time_to_read
    (content.split.count.to_d / 300).to_i
  end
end
