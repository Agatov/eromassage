class Admin::Girls::CommentsController < AdminController
  def index
    if params[:girl_id].present?
      @girl = Girl.includes(:comments).find params[:girl_id]
      @comments = @girl.comments
    else
      @comments = GirlComment.includes(:girl).all
    end
  end

  def edit
    @comment = GirlComment.find params[:id]
  end

  def update
    @comment = GirlComment.find params[:id]
    @comment.update_attributes params[:girl_comment]

    redirect_to admin_girls_comments_path(girl_id: params[:girl_id])
  end

  def destroy
    @comment = GirlComment.find(params[:id])
    @comment.destroy

    redirect_to admin_girls_comments_path(girl_id: params[:girl_id])
  end
end 