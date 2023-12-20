class UserProfilesController < ApplicationController
  def index
    @user_profiles = UserProfile.all
  end
  
  def show
    @user_profile = UserProfile.find_by(user_id: params[:id])
  end

  def edit
    @user_profile = UserProfile.find_by(user_id: params[:id])
  end
  
  def update
      @user_profile = UserProfile.find_by(user_id: params[:id])
      if @user_profile.update(age: params[:user_profile][:age],biography: params[:user_profile][:biography],region: params[:user_profile][:region],experience_years: params[:user_profile][:experience_years],favorite_fishing_type: params[:user_profile][:favorite_fishing_type])
        @user_profile.save
        redirect_to user_profile_path
      else
        render "edit"
      end
  end
end
