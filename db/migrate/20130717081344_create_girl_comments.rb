class CreateGirlComments < ActiveRecord::Migration
  def change
    create_table :girl_comments do |t|
      t.integer :user_id
      t.integer :girl_id
      t.string :username
      t.text :text

      t.timestamps
    end
  end
end
