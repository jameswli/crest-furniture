class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :project_id
      t.integer :customer_id
      t.string :from_address
      t.string :to_address
      t.string :subject
      t.text :body
      t.datetime :timestamp

      t.timestamps
    end
  end
end
