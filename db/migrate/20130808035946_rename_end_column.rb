class RenameEndColumn < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.rename :start, :start_time
      t.rename :end, :end_time
    end
  end
end
