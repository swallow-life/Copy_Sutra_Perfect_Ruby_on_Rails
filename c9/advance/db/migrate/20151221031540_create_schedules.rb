class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :room_id, index: true, foreign_key: true
      t.timestamp :started_at
      t.timestamp :finished_at

      t.timestamps null: false
    end
  end
end
