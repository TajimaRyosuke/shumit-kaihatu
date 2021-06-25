class Admin::PostsController < ApplicationController
  def index
    # 全権一覧表示
    @posts = Post.all.order(created_at: :desc)
    # ジャンル別一覧表示
    @genre = Genre.find(params[:id]) if params[:id]
    @genres = Genre.all.order(created_at: :desc)
    # ユーザー一覧表示
    @users = User.all.order(created_at: :desc)
  end

  def show
  end

  def destroy
  end
end
