class GuestbookController < ApplicationController
  before_filter :authenticate_user!, except: :index
  def index
    @guestbook_posts = GuestbookPost.all
    build_for_create
  end

  def create_post
    @guestbook_post = GuestbookPost.new params[:guestbook_post]
    @guestbook_post.user_id = current_user.id
    @guestbook_post.save

    redirect_to guestbook_index_path, notice: t('guestbook.post_created')
  end

  def create_comment
    @post = GuestbookPost.find params[:post_id]
    
    @comment = Comment.new params[:comment]
    @comment.user_id = current_user.id
    @comment.type_cd = Comment.guestbook
    
    @post.comments << @comment
    
    #redirect_to guestbook_index_path
    render @comment
  end
private
  def build_for_create
    if user_signed_in?
      @guestbook_post = GuestbookPost.new
      @guestbook_comment = Comment.new
    end
  end
end