class Post < ApplicationRecord
  belongs_to :user
  has_many :like_users, through: :likes, source: :user
  has_many :likes, dependent: :destroy
  has_many :comments

  has_many :tags, through: :post_tags
  has_many :post_tags

  mount_uploader :image, ImageUploader
end
