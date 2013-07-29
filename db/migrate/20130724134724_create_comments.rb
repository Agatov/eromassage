class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :type_cd
      t.text :message

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :type_cd
  end
end
