class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_date_params, :only => [:create, :update]

  def index
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = current_user.events.new(event_params)
    @event.save
  end

  def update
    @event.update(event_params)
  end

  def destroy
    @event.destroy
  end

  private
    def set_date_params      
      if params[:event][:start].present?
        # set start
        params[:event][:start] = DateTime.parse( params[:event][:start] + ' ' + params[:event][:start_time] + ':00')
        # p params[:event][:start]
        # params[:event].delete(:start_time)
  #####set end
        params[:event][:end] = DateTime.parse( params[:event][:end] + ' ' + params[:event][:end_time] + ':00')
        # p params[:event][:end]
        # params[:event].delete(:end_time)
      end
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :date_range, :start, :start_time, :end, :end_time, :color, :description)
    end
end