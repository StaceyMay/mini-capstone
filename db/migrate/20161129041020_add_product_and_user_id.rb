class AddProductAndUserId < ActiveRecord::Migration[5.0]
  def change

    add_column :orders, :product_id, :integer
    add_column :orders, :user_id, :integer
  end
end
