class Admin::Girls::CommentsController < AdminController
  def index
    @comments = GirlComment.all
  end

  def destroy
    @comment = GirlComment.find(params[:id])
    @comment.destroy

    redirect_to admin_girls_comments_path
  end
end 