class User < ApplicationRecord
  attr_accessor :terms

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_one :tower_guard
  has_one :tower, through: :tower_guard

  # has_many :tower_guards
  # has_many :towers, through: :tower_guards
end
