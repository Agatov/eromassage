class Comment < ActiveRecord::Base
  attr_accessible :message
  # attr_protected :type_cd, :user_id

  belongs_to :user

  validates_presence_of :message

  as_enum :type, guestbook: 1, girl: 2, post: 3

  default_scope order: 'created_at ASC'

  def destroy_it
    case type
      when :guestbook
        comment = GuestbookPostComment.find_by_comment_id id
      when :girl
        comment = GirlComment.find_by_comment_id id
      when :post
        comment = PostComment.find_by_comment_id id
    end
    comment.destroy if comment.present?
  end
end
