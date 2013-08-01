class Comment < ActiveRecord::Base
  attr_accessible :message
  # attr_protected :type_cd, :user_id

  belongs_to :user

  as_enum :type, guestbook: 1, girl: 2

  default_scope order: 'created_at ASC'

  def destroy_it
    case type
      when :guestbook
        post_comment = GuestbookPostComment.find_by_comment_id id
        post_comment.destroy
      when :girl
        girl_comment = GirlComment.find_by_comment_id id
        girl_comment.destroy
    end
  end
end
