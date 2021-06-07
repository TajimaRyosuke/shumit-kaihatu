class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'ユーザー情報の編集が完了しました。'
    else
      render :edit, notice: 'ユーザー情報の編集に失敗しました。'
    end
  end

  def follows
      user = User.find(params[:id])
      @users = user.followings
  end

  def followers
      user = User.find(params[:id])
      @users = user.folowers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def post_params
    params.require(:post).permit(:post_title, :post_image, :opinion)
  end

end