class Program < ActiveRecord::Base
  attr_accessible :description, :duration_cd, :girls_count, :image, :preview_description, :price, :title
  as_enum :duration, one: 1, one_and_half: 2, two: 3, more_then_two: 4
  
  mount_uploader :image, SimpleUploader
end
