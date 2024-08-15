class ChangeStartAndEndTimeToDatetimeInFightersAvailabilities < ActiveRecord::Migration[7.1]
  def change
    remove_column :fighters_availabilities, :start_time
    remove_column :fighters_availabilities, :end_time
    add_column :fighters_availabilities, :start_time, :datetime
    add_column :fighters_availabilities, :end_time, :datetime
  end
end
