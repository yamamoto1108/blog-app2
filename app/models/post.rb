class Post < ApplicationRecord
  has_many :users, through: :likes
  has_many :likes

  mount_uploader :image, ImageUploader
end
