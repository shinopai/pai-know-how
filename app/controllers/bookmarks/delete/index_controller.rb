class Bookmarks::Delete::IndexController < ApplicationController
  before_action :authenticate_user!

  def delete
    @user = User.find(params[:user_id])
    @knowhow = Knowhow.find(params[:knowhow_id])

    @bookmark = Bookmark.where(user_id: @user).find_by(knowhow_id: @knowhow)
    @bookmark.destroy

    redirect_to user_profiles_path(@user), notice: 'ブックマークを外しました'
  end
end
