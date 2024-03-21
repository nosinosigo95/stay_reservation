class UsersController < ApplicationController

  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #log_out if (!cookies[:user_id].nil? && !cookies[:remember_token].nil?)
    default_image(@user)
    if @user.save
      remember @user

      flash[:notice] = "ユーザー登録に成功しました。"
      redirect_to users_account_url
    else
      render sign_up_path
    end
  end

  def edit
    @user = current_user
  end
  def account
    @user = current_user
  end
  def update
    @user = current_user
    if @user.authenticate(params[:current_password]) && @user.update(user_params)
      flash[:success] = "アカウントの設定を更新しました。"
      redirect_to users_account_url
    else
      render users_edit_path, :unprocessable_entity
    end
  end

  def profile
    @user = current_user
  end

  def profile_edit
    @user = current_user
  end
  def profile_update
    @user = current_user
    if @user && @user.update(params.require(:user).permit(:image, :name, :introduction))
      flash[:success] = "プロフィールを更新しました。"
      redirect_to users_profile_url
    else
      render users_profile_edit_path
    end
  end
  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation)
  end
  def default_image(user)
    if user.image.nil?
      user.image.attach(io: File.open('/app/assets/images'), filename: 'default_icon.png', content_type: 'application/png')
    end
  end
end