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
        @post = Post.where("post_title LIKE?","%#{word}%")
    end
end
