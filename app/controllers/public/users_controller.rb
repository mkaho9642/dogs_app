class Public::UsersController < ApplicationController
  def mypage
    @user = current_user
    render 'mypage'
  end

  def show
    @user = User.find(params[:id])
    render 'user'
  end

  def index
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks
    render 'bookmark'
  end

  def edit
    @user = User.find(params[:id])
    render 'edit'
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: '登録情報を更新しました。'
    else
      render 'edit'
    end
  end

  def confirm
    @user = current_user
    render 'confirm'
  end
  
  def quit
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path, notice: '退会しました。'
  end

  private
  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
  end
  def user_state
    @user = user.find_by(email: params[:user][:email])
    return if user.nil?
    return unless user.valid_password?(params[:user][:password])
  end
end
