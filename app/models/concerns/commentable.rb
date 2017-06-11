module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable
  end

  def average_notation
    comments.where.not(notation: nil).average(:notation)
  end

  def good_notation_percent
    comments.where.not(notation: nil).count.zero? ? 0 : (comments.where('notation >= 3').count.to_d / comments.where.not(notation: nil).count.to_d * 100).to_i
  end
end
