class UserLists::IndexController < ApplicationController
  before_action :authenticate_user!

  def index
    # 現在のログインユーザーを取得
    @user = current_user

    # 関連するプロフィールを取得
    @user_profile = @user.user_profile

    # 現在のログインユーザー以外の全てのユーザーを取得
    @users = User.where.not(id: @user.id).page(params[:page]).per(12)

    render template: 'user_lists/index'
  end
end
