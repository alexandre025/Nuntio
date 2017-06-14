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

  # Methods

  def fullname
    "#{firstname} #{lastname}".strip
  end

  def is_subscriber?(tower = nil)
    return true if UserSubscription.joins(:subscription).where(user_id: id, subscriptions: { tower_id: tower.id }).count > 0
  end

  # Ransack

  ransacker :fullname do |parent|
    Arel::Nodes::InfixOperation.new('||', Arel::Nodes::InfixOperation.new('||', parent.table[:firstname], Arel::Nodes.build_quoted(' ')), parent.table[:lastname])
  end
end
