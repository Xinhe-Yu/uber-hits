class AddHaveInsuranceToFighters < ActiveRecord::Migration[7.1]
  def change
    add_column :fighters, :have_insurance, :boolean, default: false
  end
end
