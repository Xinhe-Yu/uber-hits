class CreateFighterWeeklyAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :fighter_weekly_availabilities do |t|
      t.references :fighter, null: false, foreign_key: true
      t.boolean :monday, default: false
      t.boolean :tuesday, default: false
      t.boolean :wednesday, default: false
      t.boolean :thursday, default: false
      t.boolean :friday, default: false
      t.boolean :saturday, default: false
      t.boolean :sunday, default: false

      t.timestamps
    end
  end
end
