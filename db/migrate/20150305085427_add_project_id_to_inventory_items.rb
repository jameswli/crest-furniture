class AddProjectIdToInventoryItems < ActiveRecord::Migration
  def change
    add_column :inventory_items, :project_id, :integer
  end
end
