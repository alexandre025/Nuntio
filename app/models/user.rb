class User < ApplicationRecord
  attr_accessor :terms

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one :tower_guard
  has_one :tower, through: :tower_guard

  # has_many :tower_guards
  # has_many :towers, through: :tower_guards

  has_many :user_subscriptions
  has_many :subscriptions, through: :user_subscriptions

  has_many :confirmed_subscriptions, -> { where(state: :confirmed) }, through: :user_subscriptions, source: :subscription
  has_many :subscribed_towers, through: :confirmed_subscriptions, source: :tower
  has_many :subscribed_reports, through: :subscribed_towers, source: :reports

  has_many :owned_subscriptions, class_name: 'Subscription', foreign_key: :owner_id

  # Validators
  validates :firstname, :lastname, presence: true
  validates_acceptance_of :terms, allow_nil: false, accept: true, on: :create, message: 'doivent être acceptées'
  validates_confirmation_of :password

  # Methods

  def fullname
    "#{firstname} #{lastname}".strip
  end

  def is_subscriber?(tower)
    subscribed_towers.where(id: tower.id).any?
  end

  # Ransack

  ransacker :fullname do |parent|
    Arel::Nodes::InfixOperation.new('||', Arel::Nodes::InfixOperation.new('||', parent.table[:firstname], Arel::Nodes.build_quoted(' ')), parent.table[:lastname])
  end

  # Paperclip

  has_attached_file :image,
                  styles: { thumb: '120x120^' },
                  url: '/nuntio/users/:id/:style/:basename.:extension',
                  default_url: '/images/img/default-avatar.png',
                  path: ':rails_root/public/nuntio/users/:id/:style/:basename.:extension',
                  convert_options: { all: '-strip -auto-orient -gravity center -colorspace sRGB' }

  validates_attachment :image, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }
end
