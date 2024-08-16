class AddCoordinatesToFighters < ActiveRecord::Migration[7.1]
  def change
    add_column :fighters, :latitude, :float
    add_column :fighters, :longitude, :float
    add_column :fighters, :address, :string
  end
end
