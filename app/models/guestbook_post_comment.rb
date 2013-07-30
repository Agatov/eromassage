class GuestbookPostComment < ActiveRecord::Base
  # attr_protected :comment_id, :guestbook_post_id
  belongs_to :comment, dependent: :destroy
  belongs_to :guestbook_post
end
