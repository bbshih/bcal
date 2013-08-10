class ChangeTimeColumnsToDatetime < ActiveRecord::Migration
  def change
    remove_column :events, :start_time, :time
    remove_column :events, :end_time, :time
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
  end
end
