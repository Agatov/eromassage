class GirlComment < ActiveRecord::Base
  attr_accessible :text, :user_id, :username

  belongs_to :girl, counter_cache: :count_of_comments

  default_scope order: {id: :desc}
end
