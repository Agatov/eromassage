class CreateGuestbookPosts < ActiveRecord::Migration
  def change
    create_table :guestbook_posts do |t|
      t.text :message
      t.integer :user_id

      t.timestamps
    end
  end
end
