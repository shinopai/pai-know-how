class Knowhows::Create::IndexController < ApplicationController
  before_action :authenticate_user!

  def create
    render template: 'knowhows/create/index'
  end
end
