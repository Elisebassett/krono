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
    tomorrow_events = current_user.events.where('DATE(start) = ?', DateTime.tomorrow).sort_by &:start

    tomorrow = DateTime.tomorrow

    rise = current_user[:rise].change(year: tomorrow.year, month: tomorrow.month, day: tomorrow.day)
    p 'RISE'
    p current_user[:rise]
    p rise

    p 'TOMORROW EVENTS'
    p tomorrow_events

    tomorrow_events.length.times do |i|
      
      if i == 0
        p 'FIRST APPOINTMENT'
        p i
        

        difference = tomorrow_events[i][:start].to_time - rise

        p 'MORNING DIFFERENCE'
        p tomorrow_events[i][:start]
        p rise
        p difference

        p 'TIME ALLOCATION'
        p (@goal[:time_allocation]) + 20

        p 'SET GOAL?'
        p (@goal[:time_allocation]) + 20 < (tomorrow_events[i][:start].to_time - rise)/60


        if (@goal[:time_allocation]) + 20 < (tomorrow_events[i][:start].to_time - rise)/60

         
          
          p 'SET A MORNING GOAL'

        end #set goal before first appointment
      end

      if i > 0
        #time_allocation is saved in db as minutes. The comparison eqution results in seconds, thus the division by 60
        p 'IN BETWEEN EVENTS'
        p ' '

        if (@goal[:time_allocation]) + 20 < (tomorrow_events[i][:start].to_time - tomorrow_events[i-1][:end].to_time)/60

          # difference = tomorrow_events[i][:start] - tomorrow_events[i-1][:end]
          # p 'START TIME'
          # p tomorrow_events[i][:start]
          # p 'END TIME'
          # p tomorrow_events[i-1][:end]
          # p 'THIS IS THE DIFFERENCE'
          # p difference
          


          p 'SET A GOAL!!!'
        end #set the goal between appointments


        
      end #if it's not the first event
    end #times loop
  end# end of set_goal_event

  def calculate_event_params
    
  end


  private

    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(:time_allocation, :name, :description, :type)
    end

end
