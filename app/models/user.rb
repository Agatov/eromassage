class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :confirmable, :validatable

  attr_accessible :email, :password, :password_confirmation, :avatar, :nickname

  mount_uploader :avatar, SimpleUploader
end