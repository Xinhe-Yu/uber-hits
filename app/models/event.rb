class Event < ApplicationRecord
  attr_accessor :duration
  
  belongs_to :user
  belongs_to :fighter
  has_many :reviews, dependent: :nullify
  has_one_attached :photo


  EVENT_TYPE = %w[programmed ambush]
  STATUS = %w[pending accepted declined]

  validates :title, presence: true
  validates :fight_type, presence: true, inclusion: { in: EVENT_TYPE, message: "%{value} is not a valid fight type" }
  validates :status, inclusion: { in: STATUS, message: "%{value} is not a valid status" }
  # validates :description, :place, format: { with: /\A\S.*\S\z|\A\S\z/, message: "cannot be blank or consist only of whitespace" }
  validate :cannot_have_only_whitespace
  validate :user_cannot_be_fighter

  private

  def user_cannot_be_fighter
    if user == fighter.user
      errors.add(:base, 'User cannot create an event where they are the fighter')
    end
  end

  def cannot_have_only_whitespace
    if description.length.positive? && !description.match?(/\S/)
      errors.add(:description, "cannot consist only of whitespaces")
      return false
    end
  end
end
