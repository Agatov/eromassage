class Schedule < ActiveRecord::Base
  attr_accessible :worked_on, :girl_id
  validates_uniqueness_of :worked_on, scope: :girl_id
  has_one :girl
end
