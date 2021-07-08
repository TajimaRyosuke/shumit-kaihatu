class PostsController < ApplicationController
  before_action :correct_user, only: [:edit]

  def index
    # 全権一覧表示
    @posts = Post.reverse_order.order(created_at: :desc)
    # ジャンル別一覧表示
    @genre = Genre.find(params[:id]) if params[:id]
    @genres = Genre.page(params[:page]).reverse_order.order(created_at: :desc)
    @genres_index = Genre.all

    @post_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "投稿が成功しました。"
    else
      render :new, notice: "投稿に失敗しました。やり直してください。"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿の編集が完了しました。"
    else
      render :edit, notice: "投稿の編集ができませんでした。"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: "投稿の削除が完了しました。"
  end

  def correct_user
    @post = Post.find(params[:id])
    unless @post.user.id == current_user.id
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_image, :post_title, :opinion, :genre_id)
  end
end
