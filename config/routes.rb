Rails.application.routes.draw do

  get 'rooms/show'
  get 'notifications/index'
  devise_for :admins
  devise_for :users
  root :to => 'homes#top'

  resources :users do
   resource :relationships, only: [:create, :destroy]
   get :follows, on: :member #追加
   get :followers, on: :member #追加
 end

  resources :posts do
    resource :favorites, only: [:create, :destroy] # いいね
    resources :post_comments, only: [:create] # コメント投稿
  end

  get 'search' => 'searches#search' # 検索機能

  resources :chats, only: [:create] # チャット機能
  resources :rooms, only: [:create, :show]

  resources :genres, only: [:index, :create, :edit, :update,:destroy ]

  namespace :admin do
      root to: 'homes#top'
      resources :genres, only: [:index, :create, :edit, :update,:destroy ]
      resources :posts, only: [:index, :show, :destroy ]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
