class UsersController < ApplicationController
  def mypage
    @user = User.find(params[:id])
    @post_review = @user.post_review
  end

  def show
    @user = User.find(params[:id])
    @post_review = @user.post_review
  end

  def edit
    @user = User.find(params[:id])
  end

  def confirm
  end
end
