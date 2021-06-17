class UsersController < ApplicationController
  def show
    # ユーザー情報
    @user = User.find(params[:id])
    # ユーザー投稿内容
    @posts = @user.posts.all.order(created_at: :desc)

    # チャット
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
      @msg ="他のユーザーとDMしてみよう！"
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      if @isRoom != true
        @room = Room.new
        @entry = Entry.new
      end

    end
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
      @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def post_params
    params.require(:post).permit(:post_title, :post_image, :opinion)
  end

end