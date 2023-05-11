class Knowhows::Search::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q

  def search
    # 現在ログイン中のユーザー取得
    @user = current_user

    # 関連するプロフィール取得
    @user_profile = @user.user_profile

    # 検索結果取得
    @knowhows = @q.result.page(params[:page]).per(6)

    render template: 'knowhows/search/index'
  end


  # private
  private
  def set_q
    @q = Knowhow.ransack(params[:q])
  end
end
