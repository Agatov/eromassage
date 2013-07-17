class GirlCommentsController < ApplicationController
  def index
    @girl_comments = GirlComment.where girl_id: params[:girl_id]

    render json: @girl_comments
  end

  def create
    @girl = Girl.find params[:girl_id]
    @girl.comments.build params[:girl_comment]
    if @girl.save
      render json: {status: :success}
    else
      render json: {status: :error}
    end
  end
end