class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :user_id
      t.integer :customer_id
      t.integer :project_id

      t.timestamps
    end
  end
end
