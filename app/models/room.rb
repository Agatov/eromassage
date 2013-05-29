class Room < ActiveRecord::Base
  attr_accessible :about, :avatar, :name

  has_many :room_photos
  has_many :photos, through: :room_photos

  mount_uploader :avatar, AvatarUploader
end
