class UserProfiles::IndexController < ApplicationController
  before_action :authenticate_user!

  def index
    render template: 'user_profiles/index'
  end
end
