class Follows::Create::IndexController < ApplicationController
  before_action :authenticate_user!

  def submit
    @user = current_user

    @new_follow = @user.follows.build(follow_params)
    @new_follow.save

    redirect_to user_profiles_path(follow_params[:partner_id])
  end


  # private

  private
  def follow_params
    params.require(:follow).permit(:partner_id)
  end
end
