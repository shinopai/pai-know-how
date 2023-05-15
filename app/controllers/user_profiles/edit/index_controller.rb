class UserProfiles::Edit::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def index
    @user_profile = @user.user_profile

    render template: 'user_profiles/edit/index'
  end

  def submit
    @user_profile = @user.user_profile

    if @user.user_profile.update(user_profile_params)
      redirect_to user_profiles_path(@user), notice: 'プロフィールを更新しました'
    else
      render template: 'user_profiles/edit/index'
    end
  end


  # private

  private
  def user_profile_params
    params.require(:user_profile).permit(
      :name,
      :birth_year,
      :birth_month,
      :birth_day,
      :profile_image,
      :sex,
      :tel
    )
  end

  def find_user
    @user = User.find(params[:id])
  end
end
