class Comment < ActiveRecord::Base
  attr_accessible :message
  # attr_protected :type_cd, :user_id

  belongs_to :user

  as_enum :type, guestbook: 1

  default_scope order: 'created_at ASC'
end
