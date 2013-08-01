class GirlsController < ApplicationController
  def index
    @girls = Girl.includes(:comments).all
    @comment = Comment.new if user_signed_in?
  end
end