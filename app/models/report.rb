class Report < ApplicationRecord
  include Commentable

  before_save :update_read_time

  has_many :sources, class_name: 'ReportSource'

  belongs_to :tower
  belongs_to :tower_guard

  has_one :guard, through: :tower_guard

  validates :tower, :title, :content, :tower_guard, presence: true

  def update_read_time
    calculated_time = (self.content.split.count.to_d / 300).round
    self.read_time = calculated_time >= 1 ? calculated_time : 1
  end

  # Paperclip

  has_attached_file :image,
                  styles: { thumb: '240x165^', banner: '620x240^' },
                  url: '/nuntio/reports/:id/:style/:basename.:extension',
                  default_url: '/images/default-report.jpg',
                  path: ':rails_root/public/nuntio/reports/:id/:style/:basename.:extension',
                  convert_options: { all: '-strip -auto-orient -gravity center -colorspace sRGB' }

  validates_attachment :image, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }
end
