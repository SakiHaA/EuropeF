class Public::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def reject_user
    @user = User.find_by(user_name: params[:user][:user_name])
    if @user 
      if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
        flash[:notice] = "このアカウントは退会済みです"
        redirect_to new_user_registration
      else
        flash[:notice] = "未入力の項目があります。"
      end
    end
  end

end
