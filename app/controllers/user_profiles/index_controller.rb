class UserProfiles::IndexController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])
    @follow = Follow.new

    # 関連するプロフィールテーブルが存在していないなら作成
    if @user.user_profile.nil?
      user_profile = @user.build_user_profile
      user_profile.save!
    end

    # 関連するプロフィールを取得
    @user_profile = @user.user_profile

    # 関連するノウハウを取得
    @knowhows = Knowhow.order(id: :desc).page(params[:page]).per(6)

    render template: 'user_profiles/index'
  end

  def get_timelines
    @user = current_user

    # 関連するプロフィールを取得
    @user_profile = @user.user_profile

    # フォロー中のユーザーが投稿したノウハウを全て取得
    ids = @user.follows.pluck(:partner_id)
    @knowhows = Knowhow.where(user_id: ids).page(params[:page]).per(6)

    render template: 'user_profiles/timelines'
  end
end
