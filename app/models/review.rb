class Review < ApplicationRecord
  belongs_to :event

  validates :event, uniqueness: { scope: :user_to_fighter, message: "You can only leave one review per event." }
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validate :validate_comment

  def validate_comment
    validate_field_cannot_have_only_whitespace(:comment)
  end

  def time_range
    [[1, "second"], [60, "minute"], [60 * 60, "hour"],
     [60 * 60 * 24, "day"], [60 * 60 * 24 * 7, "week"],
     [Float::INFINITY, "more than one week"]]
  end

  def passed_time
    interval = (Time.current - updated_at.to_time).round
    i = time_range.find_index { |tuple| tuple[0] > interval }
    res = "#{interval / time_range[i - 1][0]} #{time_range[i - 1][1]}"
    res.to_i == 1 ? "#{res} ago" : "#{res}s ago"
  end
end
