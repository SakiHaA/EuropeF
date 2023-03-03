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
      redirect_to admin_user_path(@user.id)
    else
      flash[:notice] = "更新が完了しました。"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    redirect_to admin_user_path, notice: '退会しました'
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :email, :is_deleted, :user_id)
  end
end
