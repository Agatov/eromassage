class RoomPhoto < ActiveRecord::Base
  attr_accessible :photo_id, :room_id

  belongs_to :room
  belongs_to :photo
end
