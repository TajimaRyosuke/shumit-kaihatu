class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image #Refileで画像を反映させるときにviewに対応する各modelに記述が必須
  has_many :posts, dependent: :destroy

  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  has_many :follower, class_name: "Relationship", foreign_key:"follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key:"followed_id", dependent: :destroy



#ここからダメ
  # has_many :following_user, through: :follower, source: :followed
  # has_many :follower_user, though: :followed, source: :follower

  # def follow(user_id)
  #   follower.create(followed_id: user_id)
  # end

  # def unfollow(user_id)
  #   follower.find_by(followed_id: user_id).destroy
  # end

  # def following?(user)
  #   following_user.include?(user)
  # end

  # has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # has_many :followers, though: :passive_relationships, source: :follower
#ここまでダメ

  has_many :user_rooms
  has_many :chats

end
