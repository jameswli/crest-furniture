class CreateInventoryStyles < ActiveRecord::Migration
  def change
    create_table :inventory_styles do |t|
      t.string :name
      t.string :manufacturer
      t.string :model_number
      t.string :color

      t.timestamps
    end
  end
end
