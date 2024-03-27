module SessionsHelper

  def remember(user)
    user.remember #データベースへ保存
    cookies.permanent.encrypted[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if((user_id = cookies.encrypted[:user_id]) && (user = User.find_by(id: user_id)) )
      if((remember_token = cookies[:remember_token]) && user.authenticated?(remember_token))
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    @current_user = nil
  end
  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログイン又はアカウント登録してください。"
      redirect_to log_in_url, status: :see_other
    end
  end
end