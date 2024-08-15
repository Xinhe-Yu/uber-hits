class Event < ApplicationRecord
  attr_accessor :duration

  belongs_to :user
  belongs_to :fighter
  has_many :reviews, dependent: :nullify
  has_one_attached :photo

  EVENT_TYPE = %w[programmed ambush]
  STATUS = %w[pending accepted declined]

  validates :title, presence: true
  validates :fight_type, presence: true, inclusion: { in: EVENT_TYPE, message: "%<value> is not a valid fight type" }
  validates :start_time, presence: true
  validate :validate_start_time
  validate :validate_end_time

  validates :status, inclusion: { in: STATUS, message: "%<value> is not a valid status" }

  validate :user_cannot_be_fighter
  validate :validate_description

  private

  def user_cannot_be_fighter
    errors.add(:base, 'User cannot book itself as fighter') if user == fighter.user
  end

  def validate_start_time
    date_cannot_be_too_early(:start_time, message: "can't be a passed moment")
  end

  def validate_end_time
    date_cannot_be_too_early(:end_time, post_quem: start_time, message: "can't before start time")
  end

  def validate_description
    validate_field_cannot_have_only_whitespace(:description)
  end
end
