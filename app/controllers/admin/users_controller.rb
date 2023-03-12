class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      redirect_to admin_user_path(@user.id), notice: 'ユーザー情報を編集しました。'
    else
      flash[:notice] = "未入力の項目がある、もしくはすでに使用されているメールアドレスです。"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :is_deleted, :user_id)
  end
end