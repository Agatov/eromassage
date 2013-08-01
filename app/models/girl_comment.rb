class GirlComment < ActiveRecord::Base
  attr_accessible :comment_id, :girl_id
  belongs_to :girl
  belongs_to :comment
end
