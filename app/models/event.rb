class Event < ApplicationRecord
  belongs_to :user
  belongs_to :fighter
  has_many :reviews

  EVENT_TYPE = %w[programmed ambush]
  STATUS = %w[pending accepted declined]

  validates :title, presence: true
  validates :fight_type, presence: true, inclusion: { in: EVENT_TYPE, message: "%{value} is not a valid fight type" }
  validates :status, presence: true, inclusion: { in: STATUS, message: "%{value} is not a valid status" }
  validates :description, :place, format: { with: /\A\S.*\S\z|\A\S\z/, message: "cannot be blank or consist only of whitespace" }
  validate :user_cannot_be_fighter

  private

  def user_cannot_be_fighter
    if user_id == fighter.user_id
      errors.add(:base, 'User cannot create an event where they are the fighter')
    end
  end
end
