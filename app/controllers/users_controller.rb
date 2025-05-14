class UsersController < ApplicationController
  def mypage
  end

  def show
    @user = User.find(params[:id])
    @post_review = @user.post_review
  end

  def edit
    @user = User.find(params[:id])
  end
end
