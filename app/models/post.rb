class Post < ApplicationRecord
  belongs_to :user
  has_many :like_users, through: :likes, source: :user
  has_many :likes, dependent: :destroy
  has_many :comments

  mount_uploader :image, ImageUploader
end
