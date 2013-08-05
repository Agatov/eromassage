class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :confirmable, :validatable

  attr_accessible :email, :password, :password_confirmation, :avatar, :nickname
  # attr_protected :is_admin

  mount_uploader :avatar, UserUploader

  def is_admin?
    is_admin
  end
end
