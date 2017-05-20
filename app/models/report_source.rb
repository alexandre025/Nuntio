class ReportSource < ApplicationRecord
  belongs_to :report

  validates :url, presence: true
end
