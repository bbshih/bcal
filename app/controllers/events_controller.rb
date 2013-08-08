class EventsController < ApplicationController
  before_filter :find_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.order('start_time ASC')
    @ordered_events_by_day = @events.group_by(&:day)
    @days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    @event = Event.new
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to events_path, notice: "Event added"
    else
      render action: :new, alert: "Event not added"
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to events_path, notice: "Event updated"
    else
      render action: :new, alert: "Event not updated"
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Event deleted"
  end

  private

  def event_params
    params.require(:event).permit(:full_details, :day, :start_time, :end_time, :description)
  end

  def find_event
    @event = Event.find(params[:id])
  end

end
