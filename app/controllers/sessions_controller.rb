class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  def create
    user = User.find_by(mail: params[:sessions][:mail])
    #log_out if (!cookies[:user_id].nil? && !cookies[:remember_token].nil?)
    if user.authenticate(params[:sessions][:password])
      params[:sessions][:remember_me] == '1' ? remember(user) :forget(user)
      redirect_to users_profile_url
    else
      flash.now[:errors] = 'Invalid mail/password conbination'
      render sign_up_path, status: :unprocessable_entity
    end
  end
  def destroy
    log_out if logged_in?
    redirect_to root_url, status: :see_other
  end
end
