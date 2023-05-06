class ApplicationController < ActionController::Base
  # ログイン後、マイページに遷移
  def after_sign_in_path_for(resource)
    user_profiles_path(resource)
  end
end
