class Post < ApplicationRecord
  attachment :post_image

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :genre

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(word)
    @post = where("post_title LIKE?", "%#{word}%")
  end

  has_many :notifications, dependent: :destroy

  # バリデーションの設定
  validates :post_title, length: { minimum: 1, maximum: 10 }
  validates :opinion, length: { minimum: 1, maximum: 102 }
end
