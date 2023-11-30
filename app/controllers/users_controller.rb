class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
    @user=User.new
  end
  
  def create
    if User.exists?(username: params[:user][:username])
      redirect_to new_user_path
    else
      user=User.new(username: params[:user][:username],password: params[:user][:pass])
      user.save
      redirect_to top_login_path
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
end
