Rails.application.routes.draw do

  devise_for :users
  root :to => 'homes#top'

  resources :users
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォローを外す
  get '/users/:id/following(.:format)' => 'users#following', as: 'following_user'
  get '/users/:id/followers(.:format)' => 'users#followers', as: 'followers_user'

  resources :posts do
    resource :favorites, only: [:create, :destroy] # いいね
    resources :post_comments, only: [:create] # コメント投稿
  end

  get 'search' => 'searches#search' # 検索機能

  get 'chat/id' => 'chats#show', as: 'chat' # DMチャット
  resources :chats, only: [:create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
