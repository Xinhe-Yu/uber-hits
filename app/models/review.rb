class Review < ApplicationRecord
  belongs_to :event

  validates :event, uniqueness: { scope: :user_to_fighter, message: "You can only leave one review per event." }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validate :validate_comment

  def validate_comment
    validate_field_cannot_have_only_whitespace(:comment)
  end

  def passed_time
    time_interval(updated_at.to_time)
  end

  def time_range
    [[1, "second"], [60, "minute"], [60 * 60, "hour"],
     [60 * 60 * 24, "day"], [60 * 60 * 24 * 7, "week"],
     [Float::INFINITY, "more than one week"]]
  end
end
