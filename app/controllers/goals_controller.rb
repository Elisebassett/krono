class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    @goals = current_user.goals.all
  end

  def show

  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    @goal.save
  end

  def edit
    
  end

  def update
    @goal.update(goal_params)
  end

  def destroy
    respond_to do |format|
      @goal.destroy
      format.js # destroy.js.erb
    end
  end

  def edit_goal
    render 'edit', layout: false
  end

  private

    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(:time_allocation, :name, :description)
    end

end
