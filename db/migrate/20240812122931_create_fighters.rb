class CreateFighters < ActiveRecord::Migration[7.1]
  def change
    create_table :fighters do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.date :birth_date
      t.float :height
      t.float :weight
      t.string :fight_style
      t.string :description

      t.timestamps
    end
  end
end
