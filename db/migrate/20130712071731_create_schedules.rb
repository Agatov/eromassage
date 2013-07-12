class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :girl_id
      t.date :worked_on
    end
  end
end
