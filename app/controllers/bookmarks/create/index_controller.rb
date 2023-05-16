class Bookmarks::Create::IndexController < ApplicationController
  before_action :authenticate_user!

  def submit
    @user = User.find(params[:user_id])
    @knowhow = Knowhow.find(params[:knowhow_id])
    @user.bookmark_knowhows << @knowhow

    redirect_to user_profiles_path(@user), notice: 'ブックマークしました'
  end
end
