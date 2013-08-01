class GirlsController < ApplicationController
  def index
    @girls = Girl.includes(:comments).all
    @comment = Comment.new
  end
end