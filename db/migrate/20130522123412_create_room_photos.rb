class CreateRoomPhotos < ActiveRecord::Migration
  def change
    create_table :room_photos do |t|
      t.integer :room_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
