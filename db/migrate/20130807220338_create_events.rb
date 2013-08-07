class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :day
      t.time :start
      t.time :end
      t.string :description

      t.timestamps
    end
  end
end
