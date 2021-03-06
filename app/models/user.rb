class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :posts
has_many :like_posts, through: :likes, source: :post
has_many :likes, dependent: :destroy
has_many :comments, dependent: :destroy

mount_uploader :image, ImageUploader
validates :email, presence: true
validates :name, presence: true
end
