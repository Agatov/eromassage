class GirlComment < ActiveRecord::Base
  attr_accessible :text, :user_id, :username

  belongs_to :girl

  default_scope order: {id: :desc}
end
