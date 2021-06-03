class PostsController < ApplicationController
  def index
    # 全権一覧表示
    @posts = Post.all
    # ジャンル別一覧表示
    @genre = Genre.find(params[:id]) if params[:id]
    @genres = Genre.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
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
    redirect_to posts_path, notice:"投稿の削除が完了しました。"
  end


  private
  def post_params
    params.require(:post).permit(:post_image, :post_title, :opinion )
  end
end