class Review < ApplicationRecord
  belongs_to :event

  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, length: { minimum: 5 }, too_short: "doit contenir au moins %{count} caractères"
  validates :comment_cannot_be_blank_or_whitespace

  private

  def comment_cannot_be_blank_or_whitespace
    if comment.strip.empty?
      errors.add(:comment, "cannot be blank or consist only of whitespace")
    end
  end
end
