class Knowhows::Create::IndexController < ApplicationController
  before_action :authenticate_user!
  before_action :init_knowhow

  def create
    render 'knowhows/create/index'
  end

  def submit
    @user = User.find(params[:user_id])
    @format = params[:format]

    # 保存形式によって保存先テーブルを切り分け
    if @format == '1'
      @new_draft = @user.drafts.new(knowhow_params)

      if @new_draft.save
        # コントローラーとアクションを取得
        @path = Rails.application.routes.recognize_path(request.referer)
        redirect_to user_profiles_path(@user), notice: '下書きに保存しました'
      else
        render 'knowhows/create/index'
      end
    elsif @format == '2'
      @new_knowhow = @user.knowhows.new(knowhow_params)

      if @new_knowhow.save
        # コントローラーとアクションを取得
        @path = Rails.application.routes.recognize_path(request.referer)
        redirect_to user_profiles_path(@user), notice: 'アウトプットしました'
      else
        render 'knowhows/create/index'
      end
    else
      render 'knowhows/create/index'
    end
    end

  # private
  private

  def knowhow_params
    params.require(:knowhow).permit(:category_id, :title, :content)
  end

  def init_knowhow
    @knowhow = Knowhow.new
  end
end
