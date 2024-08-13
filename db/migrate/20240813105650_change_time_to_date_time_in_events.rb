class ChangeTimeToDateTimeInEvents < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :start_time, :datetime, using: "('1970-01-01 ' || start_time)::timestamp"
    change_column :events, :end_time, :datetime, using: "('1970-01-01 ' || end_time)::timestamp"
  end
end
