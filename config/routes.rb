Rails.application.routes.draw do

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

  get 'chat/id' => 'chats#show', as: 'chat' # DMチャット
  resources :chats, only: [:create, :show]
  resources :genres, only: [:index, :create, :edit, :update,:destroy ]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
