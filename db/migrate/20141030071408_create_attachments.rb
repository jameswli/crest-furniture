class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :file_attachment
      t.string :type
      t.integer :project_id

      t.timestamps
    end
  end
end
