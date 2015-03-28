class DropDesignBlocks < ActiveRecord::Migration
  def change
  	drop_table :design_blocks
  end
end
