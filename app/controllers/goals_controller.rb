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

  def set_goal
    @goal = Goal.find(params[:id])
    tomorrow_events = current_user.events.where('DATE(start) = ?', Date.tomorrow).sort_by &:start

    p tomorrow_events
    tomorrow_events.length.times do |i|
      
      if i > 0
        #time_allocation is saved in db as minutes. The comparison eqution results in seconds, thus the division by 60
        if (@goal[:time_allocation]) + 20 < (tomorrow_events[i][:start].to_time - tomorrow_events[i-1][:end].to_time)/60

          difference = tomorrow_events[i][:start] - tomorrow_events[i-1][:end]
          p 'START TIME'
          p tomorrow_events[i][:start]
          p 'END TIME'
          p tomorrow_events[i-1][:end]
          p 'THIS IS THE DIFFERENCE'
          p difference
          p 'TIME ALLOCATION'
          p (@goal[:time_allocation]) + 20


          p 'SET A GOAL!!!'
        end #set the goal if
        
      end #if it's not the first event
    end #times loop

  end


  private

    def goal_params
      params.require(:goal).permit(:time_allocation, :name, :description)
    end

end
