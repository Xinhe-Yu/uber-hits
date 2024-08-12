class Fighter < ApplicationRecord
  belongs_to :user
  has_many :events
  has_many :reviews, through: :events
  has_many :fighters_availabilities

  validates :first_name, :last_name, :nickname, presence: true, length: { minimum: 3 }
  validates :nickname, uniqueness: true
  validates :birth_date, presence: true
  validate :birth_date_cannot_be_in_the_future
  validates :height, numericality: { greater_than_or_equal_to: 120, less_than_or_equal_to: 300, message: "must be between 120 and 300 cm" }
  validates :weight, numericality: { greater_than_or_equal_to: 45, less_than_or_equal_to: 200, message: "must be between 45 and 200 kg" }
  validates :description, format: { with: /\A\S.*\S\z|\A\S\z/, message: "cannot be blank or consist only of whitespace" }

  private

  def birth_date_cannot_be_in_the_future
    if birth_date.present? && birth_date > Date.today
      errors.add(:birth_date, "can't be in the future")
    end
  end
end
