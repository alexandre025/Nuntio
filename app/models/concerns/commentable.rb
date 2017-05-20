module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
  end

  def average_notation
    comments.where.not(notation: nil).average(:notation)
  end
end
