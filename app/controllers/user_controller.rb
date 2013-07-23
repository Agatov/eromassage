class UserController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_user, only: :update
  def index
    @user = current_user
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes params[:user]
    redirect_to user_index_path, notice: t('notifications.updated')
  end

private
  def check_user
    unless current_user.id == params[:id].to_i
      redirect_to user_index_path, flash:{ error: t('notifications.perission_error')}
    end
  end
end