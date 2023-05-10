class UserProfiles::IndexController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:id])

    # 関連するプロフィールテーブルが存在していないなら作成
    if @user.user_profile.nil?
      user_profile = @user.build_user_profile
      user_profile.save!
    end

    # 関連するプロフィールを取得
    @user_profile = @user.user_profile

    # 関連するノウハウを取得
    @user_knowhows = Knowhow.where(user_id: @user.id).page(params[:page]).per(6)

    render template: 'user_profiles/index'
  end
end
