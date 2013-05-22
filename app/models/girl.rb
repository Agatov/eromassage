class Girl < ActiveRecord::Base
  attr_accessible :about, :age, :bubs, :height, :name, :weight

  has_many :girl_photos
  has_many :photos, through: :girl_photos
end
