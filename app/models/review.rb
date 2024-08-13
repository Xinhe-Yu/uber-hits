class Review < ApplicationRecord
  belongs_to :event

  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, length: { minimum: 3 }
  validate :cannot_have_only_whitespace

  private

  def cannot_have_only_whitespace
    if comment.length.positive? && !comment.match?(/\S/)
      errors.add(:comment, "cannot consist only of whitespaces")
      return false
    end
  end
end
