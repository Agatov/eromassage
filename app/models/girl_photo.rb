class GirlPhoto < ActiveRecord::Base
  attr_accessible :girl_id, :photo_id

  belongs_to :girl
  belongs_to :photo
end
