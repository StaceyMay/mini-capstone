class DropImageTwoColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :image_2, :string
  end
end
