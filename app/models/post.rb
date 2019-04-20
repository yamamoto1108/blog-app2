class Post < ApplicationRecord
  belongs_to :user
  has_many :like_users, through: :likes, source: :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Post.where(['text LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
