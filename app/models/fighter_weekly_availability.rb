class FighterWeeklyAvailability < ApplicationRecord
  belongs_to :fighter
  has_many :fighters_availabilities, through: :fighter
end
