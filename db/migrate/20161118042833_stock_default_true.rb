class StockDefaultTrue < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :stock, :boolean, default: true
  end
end
