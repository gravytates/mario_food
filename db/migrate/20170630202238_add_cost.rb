class AddCost < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :cost, :money
  end
end
