class Follows::Delete::IndexController < ApplicationController
  before_action :authenticate_user!

  def delete
    @user = current_user

    @user.follows.find_by(partner_id: follow_params[:partner_id]).destroy

    redirect_to user_profiles_path(follow_params[:partner_id])
  end


  # private

  private
  def follow_params
    params.require(:follow).permit(:partner_id)
  end
end
