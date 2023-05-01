class UserProfiles::IndexController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])

    render template: 'user_profiles/index'
  end
end
