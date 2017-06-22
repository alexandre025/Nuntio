class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  belongs_to :user

  validates :commentable, :user, presence: true

  default_scope { order(created_at: :desc) }
end
