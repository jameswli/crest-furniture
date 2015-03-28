class RemoveWorkingHoursFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :working_hours
  end
end
