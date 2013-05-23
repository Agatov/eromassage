class Photo < ActiveRecord::Base
  attr_accessible :image

  has_one :girl_photo
  has_one :girl, through: :girl_photo

  has_one :room_photo
  has_one :room, through: :room_photo

  mount_uploader :image, PhotoUploader
end
