class SessionsController < ApplicationController
  #6.8
  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました'
  end
  def dummy_create
    user = User.find_by(id: 1)
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました'
  end
  #6.12
  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
