class Public::UsersController < ApplicationController
  before_action :check_guest, only: [:show, :edit, :update, :destroy]
  
  def show
    @user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "更新が完了しました。"
      render :edit
    end
  end
  
  def destroy
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: '退会しました'
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :user_image)
  end
  
  def check_guest
    if current_user.email == 'guest@example.com'
      #check_guestのフラッシュメッセージがここだけ違います。
      flash[:notice] = "ゲストユーザーはユーザー機能を使用できません。"
      redirect_to request.referer
    end
  end
end