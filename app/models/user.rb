class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image #Refileで画像を反映させるときにviewに対応する各modelに記述が必須
  has_many :posts, dependent: :destroy

  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

# 自分がフォローしているユーザーとの関係
  has_many :active_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :followings,through: :active_relationships, source: :follower

# 自分がフォローされるユーザーとの関係
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(followed_id: user.id).present?
  end

  has_many :user_rooms
  has_many :chats

end
