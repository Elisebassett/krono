class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@goals = current_user.goals.all
  end

  def index
  end
end
