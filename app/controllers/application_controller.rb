class ApplicationController < ActionController::Base
  before_action :set_q

  # ログイン後、マイページに遷移
  def after_sign_in_path_for(resource)
    user_profiles_path(resource)
  end

  # 検索機能
  def set_q
    @q = Knowhow.ransack(params[:q])
  end
end
