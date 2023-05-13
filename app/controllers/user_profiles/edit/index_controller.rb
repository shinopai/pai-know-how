class UserProfiles::Edit::IndexController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    @user_profile = @user.user_profile

    render template: 'user_profiles/edit/index'
  end
end
