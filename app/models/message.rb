class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_many :notifications, dependent: :destroy

  # バリデーションの設定
  validates :body, length:{minimum:1, maximum:300}
end
