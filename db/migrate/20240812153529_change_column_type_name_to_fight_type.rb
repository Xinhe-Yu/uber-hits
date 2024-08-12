class ChangeColumnTypeNameToFightType < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :type, :fight_type
  end
end
