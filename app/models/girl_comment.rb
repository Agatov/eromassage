class GirlComment < ActiveRecord::Base
  attr_accessible :text, :user_id, :username

  belongs_to :girl
end
