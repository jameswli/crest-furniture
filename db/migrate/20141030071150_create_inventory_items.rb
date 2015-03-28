class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.string :serial_number
      t.string :status
      t.string :condition
      t.integer :inventory_style_id

      t.timestamps
    end
  end
end
