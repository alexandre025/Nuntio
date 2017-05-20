class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true

  belongs_to :user

  validates :commentable, :content, :user, presence: true
end
