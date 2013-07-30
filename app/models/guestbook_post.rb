class GuestbookPost < ActiveRecord::Base
  attr_accessible :message
  # attr_protected :user_id
  belongs_to :user

  has_many :guestbook_post_comments, dependent: :destroy
  has_many :comments, through: :guestbook_post_comments

  default_scope order('created_at DESC')
end
