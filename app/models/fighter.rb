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

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  after_save :create_fighter_weekly_availability, if: :saved_change_to_id?

  validates :first_name, :last_name, :nickname, presence: true, length: { minimum: 1 }
  validates :nickname, uniqueness: true

  validates :birth_date, presence: true
  validate :validate_birth_date

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
    return 0 if reviews.empty? || reviews.where(user_to_fighter: true).empty?

    reviews.where(user_to_fighter: true).average(:rating).round(1) # Adjust the rounding as needed
  end

  # Count the number of reviews for the fighter
  def reviews_count
    reviews.where(user_to_fighter: true).count
  end

  def accepted_passed_events
    events.where(status: "accepted").where("start_time < ?", Time.current).count
  end

  def rounded_price
    price.round
  end
  # def self.generate_arriving_disponibility
  # end

  private

  def validate_description
    validate_field_cannot_have_only_whitespace(:description)
  end

  def validate_birth_date
    date_cannot_be_too_late(:birth_date,
                            message: "can't be in the future")
    date_cannot_be_too_late(:birth_date,
                            ante_quem: Date.today - 14.years,
                            message: "can't be less than 14 years old")
    date_cannot_be_too_early(:birth_date,
                             post_quem: Date.today - 120.years,
                             message: "can't be more than 120 years old")
  end

  def create_fighter_weekly_availability
    FighterWeeklyAvailability.create!(fighter: self)
  end
end
