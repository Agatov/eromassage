class GuestbookController < ApplicationController
  before_filter :authenticate_user!, except: :index
  before_filter :build_for_create, only: :index
  def index
    @guestbook_posts = GuestbookPost.includes(:user, :comments).offset(get_offset).limit(20)

    if request.xhr?
      render partial: 'post', collection: @guestbook_posts
    end
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
    if @comment.valid?
      @post.comments << @comment
      render @comment
    else
      render json: {status: 'validation error'}, status: :unprocessable_entity
    end
  end

  def destroy_post
    if current_user.is_admin?
      @post = GuestbookPost.find params[:id]
      @post.destroy
    end
    redirect_to guestbook_index_path
  end

private
  def get_offset
    page = params[:page].to_i
    page -= 1 if page > 0
    offset = page * 20
  end

  def build_for_create
    if user_signed_in?
      @guestbook_post = GuestbookPost.new
      @guestbook_comment = Comment.new
    end
  end
end