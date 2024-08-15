class AddIsAvailableToFightersAvailabilities < ActiveRecord::Migration[7.1]
  def change
    add_column :fighters_availabilities, :is_available, :boolean, default: false
  end
end
