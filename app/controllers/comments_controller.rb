class CommentsController < ApplicationController
  def destroy
    if current_user.is_admin?
      comment = Comment.find params[:id]
      comment.destroy_it
    end
    redirect_to params[:back_url] || root_path
  end
end