class TopController < ApplicationController
  def main
    render "login"
  end

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:login_uid] = user.username
      redirect_to fishing_trips_path
    else
      flash[:alert] = 'ユーザー名またはパスワードが正しくありません。'
      render "login"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
