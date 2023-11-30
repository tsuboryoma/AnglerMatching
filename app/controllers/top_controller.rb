class TopController < ApplicationController
  def main
    render "login"
  end

  def login
    if User.find_by(username: params[:username])
      user = User.find_by(username: params[:username])
      login_password = BCrypt::Password.new(user.pass)
      if login_password == params[:pass]
        session[:login_uid] = params[:username]
        redirect_to fishing_trips_path
      end
    else
      flash[:alert] = 'ユーザー名またはパスワードがただしくありません。'
      render "login"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
