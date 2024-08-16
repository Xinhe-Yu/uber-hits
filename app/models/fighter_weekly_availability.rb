class FighterWeeklyAvailability < ApplicationRecord
  belongs_to :fighter
  has_many :fighters_availabilities, through: :fighter
  after_create :create_fighters_availabilities, if: :saved_change_to_id?

  private

  def create_fighters_availabilities
    today = Date.today.to_time
    (0..20).to_a.each do |i|
      FightersAvailability.create!(start_time: today + i.days, is_available: true, fighter: self.fighter)
    end
  end
end
