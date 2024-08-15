class Fighter < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_all_names,
                  against: %i[first_name last_name nickname],
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :user
  has_many :events, dependent: :nullify
  has_many :reviews, through: :events
  has_one :fighter_weekly_availability, dependent: :destroy
  has_many :fighters_availabilities, dependent: :destroy
  has_one_attached :photo

  after_save :create_fighter_weekly_availability, if: :saved_change_to_id?

  validates :first_name, :last_name, :nickname, presence: true, length: { minimum: 1 }
  validates :nickname, uniqueness: true
  validates :birth_date, presence: true
  validate :birth_date_cannot_be_in_the_future
  validates :height, presence: true, numericality: {
    greater_than_or_equal_to: 120,
    less_than_or_equal_to: 300,
    message: "must be between 120 and 300 cm"
  }
  validates :weight, presence: true, numericality: {
    greater_than_or_equal_to: 45,
    less_than_or_equal_to: 200,
    message: "must be between 45 and 200 kg"
  }
  validate :validate_description

  # Calculate average rating for the fighter
  def average_rating
    return 0 if reviews.empty?

    reviews.average(:rating).round(1) # Adjust the rounding as needed
  end

  # Count the number of reviews for the fighter
  def reviews_count
    reviews.count
  end

  # def self.generate_arriving_disponibility
  # end

  private

  def validate_description
    validate_field_cannot_have_only_whitespace(:description)
  end

  def birth_date_cannot_be_in_the_future
    if birth_date > Date.today
      errors.add(:birth_date, "can't be in the future")
    elsif birth_date > Date.today - 14.years
      errors.add(:birth_date, "can't be less than 14 years old")
    elsif birth_date < Date.today - 120.years
      errors.add(:birth_date, "can't be more than 120 years old")
    end
  end

  def create_fighter_weekly_availability
    FighterWeeklyAvailability.create!(fighter: self)
  end
end
