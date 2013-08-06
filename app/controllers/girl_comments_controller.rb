class GirlCommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @comment = Comment.new params[:comment]
    @comment.girl!
    @comment.user_id = current_user.id

    @girl = Girl.find params[:girl_id]

    if @comment.valid?
      @girl.comments << @comment
      render @comment
    else
      render json: {status: 'validation error'}, status: :unprocessable_entity
    end
  end
end