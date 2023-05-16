class Bookmarks::IndexController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user

    # 関連するプロフィールを取得
    @user_profile = @user.user_profile

    # ブックマークリストを取得
    @bookmarks = @user.bookmark_knowhows.page(params[:page]).per(6)

    render template: 'bookmarks/index'
  end
end
