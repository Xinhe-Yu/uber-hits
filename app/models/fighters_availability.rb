class FightersAvailability < ApplicationRecord
  belongs_to :fighter

  after_initialize :set_default_times, if: :new_record?

  private

  def set_default_times
    self.start_time ||= "09:00"
    self.end_time ||= "17:00"
  end
end
