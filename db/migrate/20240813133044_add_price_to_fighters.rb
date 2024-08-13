class AddPriceToFighters < ActiveRecord::Migration[7.1]
  def change
    add_column :fighters, :price, :decimal
  end
end
