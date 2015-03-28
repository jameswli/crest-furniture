class AddPictureToInventoryStyles < ActiveRecord::Migration
  def change
    add_column :inventory_styles, :picture, :string
  end
end
