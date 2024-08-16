class AddImagePathToFightersAndEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :fighters, :image_path, :string
    add_column :events, :image_path, :string
  end
end
