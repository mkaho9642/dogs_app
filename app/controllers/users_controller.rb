class UsersController < ApplicationController
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

  def confirm
    @user = current_user
    render 'confirm'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
