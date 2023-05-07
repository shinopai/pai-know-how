class Knowhows::Create::IndexController < ApplicationController
  before_action :authenticate_user!

  def create
    @knowhow = Knowhow.new

    render template: 'knowhows/create/index'
  end
end
