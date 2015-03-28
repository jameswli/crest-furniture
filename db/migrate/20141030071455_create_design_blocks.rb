class CreateDesignBlocks < ActiveRecord::Migration
  def change
    create_table :design_blocks do |t|
      t.date :date
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
