class PostCommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @comment = Comment.new params[:comment]
    @comment.post!
    @comment.user_id = current_user.id

    @post = Post.find params[:post_id]

    if @comment.valid?
      @post.comments << @comment
      render @comment
    else
      render json: {status: 'validation error'}, status: :unprocessable_entity
    end
  end
end