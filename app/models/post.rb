class Post < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :post_comments
  has_many :comments, through: :post_comments
end
