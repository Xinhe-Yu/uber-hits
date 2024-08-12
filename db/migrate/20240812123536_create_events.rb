class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :type
      t.string :place
      t.time :start_time
      t.time :end_time
      t.string :target
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :fighter, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
