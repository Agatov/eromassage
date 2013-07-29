class CreateGuestbookPostComments < ActiveRecord::Migration
  def change
    create_table :guestbook_post_comments do |t|
      t.integer :comment_id
      t.integer :guestbook_post_id
    end
    add_index :guestbook_post_comments, :guestbook_post_id
  end
end
