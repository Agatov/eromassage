class Girl < ActiveRecord::Base
  attr_accessible :about, :age, :available_today, :avatar, :bubs, :height, :name, :weight, :eyes

  has_many :girl_photos
  has_many :photos, through: :girl_photos

  mount_uploader :avatar, AvatarUploader
end
