class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :avatar
      t.text :about

      t.timestamps
    end
  end
end
