class Tower < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  include Commentable

  monetize :price_per_month_cents

  # Associations

  belongs_to :category

  has_one :tower_guard
  has_one :guard, through: :tower_guard
  accepts_nested_attributes_for :tower_guard

  # has_many :tower_guards
  # has_many :guards, through: :tower_guards

  has_many :subscriptions, -> { where(state: :confirmed) }
  has_many :users, through: :subscriptions

  has_many :reports

  # Delegators

  delegate :theme, to: :category

  # Constants

  FREQUENCIES = %w(daily weekly bimonthly monthly).freeze

  GRADES = %w(all beginner intermediate advanced).freeze

  SORTS = %w(popularity_desc publish_date_desc price_asc).freeze

  # Validators

  validates :category, :title, :description, :excerpt, :tower_guard, presence: true

  # Methods

  def average_time_to_read
    reports.any? ? (reports.map { |r| r.read_time }.sum / reports.count.to_d).to_i : 0
  end

  # Ransack
  ransacker :price_per_month, type: :integer, formatter: proc { |p| p * 100 } do |t|
    t.table[:price_per_month_cents]
  end

  # Paperclip

  has_attached_file :image,
                  styles: { thumb: '260x140^', banner: '620x200^' },
                  url: '/nuntio/towers/:id/:style/:basename.:extension',
                  path: ':rails_root/public/nuntio/towers/:id/:style/:basename.:extension',
                  convert_options: { all: '-strip -auto-orient -gravity center -colorspace sRGB' }

  validates_attachment :image, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }
end
