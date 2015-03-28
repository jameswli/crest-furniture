class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :type
      t.string :stage
      t.integer :customer_id
      t.datetime :sale_delivery
      t.datetime :rental_delivery
      t.datetime :rental_pickup

      t.timestamps
    end
  end
end
