class CreateGirlPhotos < ActiveRecord::Migration
  def change
    create_table :girl_photos do |t|
      t.integer :girl_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
