class FightersAvailability < ApplicationRecord
  belongs_to :fighter
  has_one :fighter_weekly_availability, through: :fighter

  # after_initialize :set_default_times, if: :new_record?
  after_initialize :generate_availability, if: :should_generate_availability?
  scope :past, -> { where('start_date < ?', Time.current - 1.days) }

  def self.delete_past_availabilities
    past.destroy_all
  end

  private

  # def set_default_times
  #   self.start_time ||= "09:00"
  #   self.end_time ||= "17:00"
  # end

  def should_generate_availability?
    new_record? && is_available.nil?
  end

  def generate_availability
    key = start_time.to_date.strftime("%A").downcase
    self.is_available = fighter_weekly_availability[key]
  end

  def days_of_week
    %w[monday tuesday wednesday thursday friday saturday sunday]
  end
end
