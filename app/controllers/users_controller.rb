class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
    @user=User.new
    @user_profile=UserProfile.new
  end
  
  def create
      if User.exists?(username: params[:user][:username])
        redirect_to new_user_path
      else
        @user = User.new(user_params)
        if @user.save
          @user_profile = UserProfile.new(user_profile_params)
          @user_profile.user_id = @user.id # UserとUserProfileを関連付ける
          @user_profile.save
          redirect_to top_login_path
          # 保存が成功した場合の処理
        else
          redirect_to new_user_path
        # 保存が失敗した場合の処理
        end
      end
  end

  private
  def user_params
    params.require(:user).permit(:username, :pass, user_profile_attributes: [:age, :biography, :region, :experience_years, :favorite_fishing_type])
  end

  def user_profile_params
    params.require(:user).require(:user_profile).permit(:age, :biography, :region, :experience_years, :favorite_fishing_type)
  end
  
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path
  end
end
