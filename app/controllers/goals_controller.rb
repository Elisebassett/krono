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

  def set_goal_event
    @goal = Goal.find(params[:id])
    tomorrow = DateTime.tomorrow
    tomorrow_events = current_user.events.where('DATE(start) = ?', tomorrow).sort_by &:start

    rise = current_user[:rise].change(year: tomorrow.year, month: tomorrow.month, day: tomorrow.day)
    sleep = current_user[:sleep].change(year: tomorrow.year, month: tomorrow.month, day: tomorrow.day)

    tomorrow_events.length.times do |i|
      
      if i == 0 #if it's the first event of the day
#time_allocation is saved in db as minutes. The comparison eqution results in seconds, thus the division by 60
        if @goal[:time_allocation] + 20 < (tomorrow_events[i][:start].to_time - rise)/60

          p 'SET A MORNING GOAL'

        end #set goal before first appointment
      
      elsif i == (tomorrow_events.length - 1)
        p 'LAST EVENT'
        
        if @goal[:time_allocation] + 20 < (tomorrow_events[i][:start].to_time - tomorrow_events[i-1][:end].to_time)/60
          
          p 'SET A GOAL!!!'
        end #set the goal between appointments    

        if @goal[:time_allocation] + 20 < (sleep - tomorrow_events[i][:end].to_time)/60
          
          p 'SET EVENING GOAL'

        end#set evening goal

      elsif i > 0 #if it's not the first or last event

        if @goal[:time_allocation] + 20 < (tomorrow_events[i][:start].to_time - tomorrow_events[i-1][:end].to_time)/60
          
          p 'SET A GOAL!!!'
        end #set the goal between appointments    
      end #end of elseif
    end #times loop
  end# end of set_goal_event


  private

    def set_goal
      @goal = Goal.find(params[:id])
    end

    def set_event_params
      
    end

    def goal_params
      params.require(:goal).permit(:time_allocation, :name, :description, :type)
    end

end
