class ChangeDefaultValuesForFighterWeeklyAvailabilities < ActiveRecord::Migration[7.1]
  def change
    change_column_default :fighter_weekly_availabilities, :monday, from: false, to: true
    change_column_default :fighter_weekly_availabilities, :tuesday, from: false, to: true
    change_column_default :fighter_weekly_availabilities, :wednesday, from: false, to: true
    change_column_default :fighter_weekly_availabilities, :thursday, from: false, to: true
    change_column_default :fighter_weekly_availabilities, :friday, from: false, to: true
    change_column_default :fighter_weekly_availabilities, :saturday, from: false, to: true
    change_column_default :fighter_weekly_availabilities, :sunday, from: false, to: true
  end
end
