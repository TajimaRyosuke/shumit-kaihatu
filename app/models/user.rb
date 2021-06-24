class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image # Refileで画像を反映させるときにviewに対応する各modelに記述が必須
  has_many :posts, dependent: :destroy

  has_many :post_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  # 自分がフォローしているユーザーとの関係
  has_many :active_relationships, class_name: "Relationship", foreign_key: :followed_id
  has_many :followings, through: :active_relationships, source: :follower

  # 自分がフォローされるユーザーとの関係
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :followed

  def followed_by?(user)
    passive_relationships.find_by(followed_id: user.id).present?
  end

  has_many :chats, dependent: :destroy
  has_many :entries, dependent: :destroy

  def self.looks(word)
    @user = User.where("name LIKE?", "%#{word}%")
  end

  # 通知がくるようにするための設定
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  # バリデーションの設定
  validates :name, presence: true, uniqueness:true, length:{minimum:2, maximum:20}
  validates :introduction, length:{maximum:50}

end