class UserProfilesController < ApplicationController
  def index
    @uuser_profiles = User_Profile.all
  end

  def edit
    @user_profile = User_Profile.find(params[:id])
  end
  
  def update
      @user_profile = User_Profile.find(params[:id])
      if @useer_profile.update(age: params[:id][:age],biography: params[:id][:biography],region: params[:id][:region],experience_years: params[:id][:experience_years],favorite_fishing_type: params[:id][:favorite_fishing_type])
        redirect_to user_profiles_path
      else
        render 'edit'
      end
  end
end
