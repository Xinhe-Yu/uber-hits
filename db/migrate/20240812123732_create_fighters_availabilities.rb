class CreateFightersAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :fighters_availabilities do |t|
      t.references :fighter, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
