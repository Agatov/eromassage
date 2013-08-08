class PostComment < ActiveRecord::Base
  attr_accessible :comment_id, :post_id
  belongs_to :comment
  belongs_to :post
end
